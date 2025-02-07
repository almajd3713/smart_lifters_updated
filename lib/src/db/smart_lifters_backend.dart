import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  // Initialize Supabase
  static Future<bool> initialize() async {
    try {
      await Supabase.initialize(
        url: 'https://ajfsdxrcgrgwupwpshgy.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFqZnNkeHJjZ3Jnd3Vwd3BzaGd5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg3MDI4NDksImV4cCI6MjA1NDI3ODg0OX0.Yl4sqd33XliRsBBxg7rfEK6elvhP2znIzK7U61s3URg',
      );
      return true;
    } catch (e) {
      print('Error initializing Supabase: $e');
      return false;
    }
  }

  // 1. Users Table CRUD
  // Create User
  Future<bool> createUser({
    required String name,
    required String email,
    required String password,
    required int age,
    String? gender,
    double? weight,
    double? height,
    String? fitnessGoal,
  }) async {
    try {
      final response = await Supabase.instance.client.from('Users').insert([
        {
          'name': name,
          'email': email,
          'password': password,
          'age': age,
          'gender': gender,
          'weight': weight,
          'height': height,
          'fitness_goal': fitnessGoal,
        }
      ]).then((data) {

      });

      if (response.error != null) {
        throw Exception('Error creating user: ${response.error!.message}');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Read User
  Future<Map<String, dynamic>?> getUser(String userId) async {
    try {
      final response = await Supabase.instance.client
          .from('Users')
          .select('*')
          .eq('id', userId)
          .single()
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error fetching user: ${response.error!.message}');
      }

      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Update User
  Future<bool> updateUser({
    required String userId,
    required String name,
    required String email,
    required String password,
    required int age,
    String? gender,
    double? weight,
    double? height,
    String? fitnessGoal,
  }) async {
    try {
      final response = await Supabase.instance.client
          .from('Users')
          .update({
            'name': name,
            'email': email,
            'password': password,
            'age': age,
            'gender': gender,
            'weight': weight,
            'height': height,
            'fitness_goal': fitnessGoal,
          })
          .eq('id', userId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error updating user: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete User
  Future<bool> deleteUser(String userId) async {
    try {
      final response = await Supabase.instance.client
          .from('Users')
          .delete()
          .eq('id', userId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error deleting user: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 2. Workouts Table CRUD
  // Create Workout
  Future<bool> createWorkout({
    required String name,
    required String category,
    String? difficulty,
    int? duration,
    double? caloriesBurned,
    String? instructions,
  }) async {
    try {
      final response = await Supabase.instance.client.from('Workouts').insert([
        {
          'name': name,
          'category': category,
          'difficulty': difficulty,
          'duration': duration,
          'calories_burned': caloriesBurned,
          'instructions': instructions,
        }
      ]).then((data) {

      });

      if (response.error != null) {
        throw Exception('Error creating workout: ${response.error!.message}');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Read Workouts
  Future<List<Map<String, dynamic>>> getWorkouts() async {
    try {
      final response =
          await Supabase.instance.client.from('Workouts').select('*').then((data) {

          });

      if (response.error != null) {
        throw Exception('Error fetching workouts: ${response.error!.message}');
      }

      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Update Workout
  Future<bool> updateWorkout({
    required int workoutId,
    required String name,
    required String category,
    String? difficulty,
    int? duration,
    double? caloriesBurned,
    String? instructions,
  }) async {
    try {
      final response = await Supabase.instance.client
          .from('Workouts')
          .update({
            'name': name,
            'category': category,
            'difficulty': difficulty,
            'duration': duration,
            'calories_burned': caloriesBurned,
            'instructions': instructions,
          })
          .eq('id', workoutId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error updating workout: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Workout
  Future<bool> deleteWorkout(int workoutId) async {
    try {
      final response = await Supabase.instance.client
          .from('Workouts')
          .delete()
          .eq('id', workoutId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error deleting workout: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 3. Meal Plans Table CRUD
  // Create Meal Plan
  Future<bool> createMealPlan({
    required String userId,
    required int dietId,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    required int dailyCaloriesTarget,
  }) async {
    try {
      final response =
          await Supabase.instance.client.from('Meal_Plans').insert([
        {
          'user_id': userId,
          'diet_id': dietId,
          'name': name,
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
          'daily_calories_target': dailyCaloriesTarget,
        }
      ]).then((data) {

          });

      if (response.error != null) {
        throw Exception('Error creating meal plan: ${response.error!.message}');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Read Meal Plans
  Future<List<Map<String, dynamic>>> getMealPlans(String userId) async {
    try {
      final response = await Supabase.instance.client
          .from('Meal_Plans')
          .select('*')
          .eq('user_id', userId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception(
            'Error fetching meal plans: ${response.error!.message}');
      }

      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Update Meal Plan
  Future<bool> updateMealPlan({
    required int mealPlanId,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    int? dailyCaloriesTarget,
  }) async {
    try {
      final response = await Supabase.instance.client
          .from('Meal_Plans')
          .update({
            'name': name,
            'start_date': startDate?.toIso8601String(),
            'end_date': endDate?.toIso8601String(),
            'daily_calories_target': dailyCaloriesTarget,
          })
          .eq('id', mealPlanId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error updating meal plan: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Meal Plan
  Future<bool> deleteMealPlan(int mealPlanId) async {
    try {
      final response = await Supabase.instance.client
          .from('Meal_Plans')
          .delete()
          .eq('id', mealPlanId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error deleting meal plan: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 4. Progress Table CRUD
  // Create Progress
  Future<bool> createProgress({
    required String userId,
    required DateTime date,
    required double weight,
    required double bodyFatPercentage,
    required double muscleMass,
    required int dailyCalories,
    required double waterIntake,
  }) async {
    try {
      final response = await Supabase.instance.client.from('Progress').insert([
        {
          'user_id': userId,
          'date': date.toIso8601String(),
          'weight': weight,
          'body_fat_percentage': bodyFatPercentage,
          'muscle_mass': muscleMass,
          'daily_calories': dailyCalories,
          'water_intake': waterIntake,
        }
      ]).then((data) {

      });

      if (response.error != null) {
        throw Exception('Error creating progress: ${response.error!.message}');
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Read Progress
  Future<List<Map<String, dynamic>>> getProgress(String userId) async {
    try {
      final response = await Supabase.instance.client
          .from('Progress')
          .select('*')
          .eq('user_id', userId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error fetching progress: ${response.error!.message}');
      }

      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Update Progress
  Future<bool> updateProgress({
    required int progressId,
    double? weight,
    double? bodyFatPercentage,
    double? muscleMass,
    int? dailyCalories,
    double? waterIntake,
  }) async {
    try {
      final response = await Supabase.instance.client
          .from('Progress')
          .update({
            'weight': weight,
            'body_fat_percentage': bodyFatPercentage,
            'muscle_mass': muscleMass,
            'daily_calories': dailyCalories,
            'water_intake': waterIntake,
          })
          .eq('id', progressId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error updating progress: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Progress
  Future<bool> deleteProgress(int progressId) async {
    try {
      final response = await Supabase.instance.client
          .from('Progress')
          .delete()
          .eq('id', progressId)
          .then((data) {

      });

      if (response.error != null) {
        throw Exception('Error deleting progress: ${response.error!.message}');
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
