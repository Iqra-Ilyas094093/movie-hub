class AppUrl {
  static String base_url = 'https://api.themoviedb.org/3';
  static String key = '?api_key=${KeyUtils.API_KEY}';
  static const imageUrl = 'https://image.tmdb.org/t/p/w500';

  static String popularMoviesEndpoint = '/movie/popular';
  static String topRatedMoviesEndpoint = '/movie/top_rated';
  static String upcomingMoviesEndpoint = '/movie/upcoming';
  static String searchMoviesEndpoint = '/search/movie';


}

class KeyUtils{
  static const  API_KEY = 'ad7db435d5b50db8cb6e0a050f0bb223';
  static const AUTHORIZE_TOKEN = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZDdkYjQzNWQ1YjUwZGI4Y2I2ZTBhMDUwZjBiYjIyMyIsIm5iZiI6MTc1OTUyNDQyNy42NjEsInN1YiI6IjY4ZTAzNjRiYzVhNjAxZDZiNDkzMjE5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2pmD7_RA52IzrLzt4QG52LZ2o41q9t82VYNCDKExBGk';
}

class omdbUrl{
  static const apiKey = '1ddf48af';
  static const baseUrl = 'https://www.omdbapi.com/';
  static const keySource = '?apikey=$apiKey';
}