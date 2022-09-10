import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static get supabaseUrl => dotenv.env['SUPABASE_URL'];
  static get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'];
}
