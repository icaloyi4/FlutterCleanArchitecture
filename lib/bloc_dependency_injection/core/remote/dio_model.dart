class ApiUrl {
  ApiUrl._();
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const TOKEN = "fa01d5f46163b78e18c1547a4719ac4a";
  static const IMAGE_URL = "https://image.tmdb.org/t/p/w500";
  static const DISCOVER_MOVIES = "${baseUrl}movie/now_playing";
  static const POPULAR_MOVIES = "${baseUrl}movie/popular";
  static const UPCOMING_MOVIES = "${baseUrl}movie/upcoming";
  static const DETAIL_MOVIES = "/movie/{movie_id}";
}
