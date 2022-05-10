import 'dart:io';

import 'package:clean_architecture_2/data/models/response/categories_response.dart';
import 'package:clean_architecture_2/data/models/response/joke_response.dart';
import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/error/failure.dart';
import '../models/request/joke_request.dart';

const String API_KEY = 'a0228bcac8msh759e880b2efc663p141273jsn890294865af8';

const String HOST = 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com';
final remoteApiProvider = Provider<RemoteApi>((ref) => RemoteApi());

class RemoteApi {
  static const String randomJokeUrl =
      'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random';

  static const String categoriesUrl =
      'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/categories';

  Future<List<Categories>> getCategories() async {
    try {
      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      final response = await dio.get(categoriesUrl,
          options: Options(headers: {
            'accept': 'application/json',
            'X-RapidAPI-Host': HOST,
            'X-RapidAPI-Key': API_KEY
          }));
      print(response);
      if (response.statusCode == 200) {
        final data = List<String>.from(response.data);
        List<Categories> result = [];
        if (data.isNotEmpty) {
          for (String title in data) {
            result.add(CategoriesResponse.fromString(title).toEntity());
          }
          return result;
        } else {
          return [];
        }
      }
      return [];
    } on DioError catch (error) {
      print(error);
      throw Failure(
          message: error.response?.statusMessage ?? 'Something went wrong');
    } on SocketException catch (error) {
      throw Failure(message: 'Plese check your connection');
    }
  }

  Future<JokeResponse?> getRandomJoke(JokeRequest request) async {
    print("categorie dans la request: ${request.category}");
    try {
      // CALL WEB SERVICE
      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      final response = await dio.get(randomJokeUrl,
          options: Options(headers: {
            'accept': 'application/json',
            'X-RapidAPI-Host': HOST,
            'X-RapidAPI-Key': API_KEY
          }),
          queryParameters: request.toMap());

      // GET THE ANSWER
      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(
            response.data); // convert the json reponse into a map

        if (data['value'].isNotEmpty) {
          return JokeResponse.fromMap(data, request.category);
        } else {
          return null;
        }
      }
      return null;
    } on DioError catch (error) {
      print(error);
      throw Failure(
          message: error.response?.statusMessage ?? 'Something went wrong');
    } on SocketException catch (error) {
      throw Failure(message: 'Plese check your connection');
    }
  }
}
