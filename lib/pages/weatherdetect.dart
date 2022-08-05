import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Widgets/WeatherInfoWidget.dart';
import 'package:weather/asset/Weather_cubit.dart';
import 'package:weather/asset/Weather_state.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({Key? key, required this.cityName}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
    ..fetchWeather(cityName);
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Weather Detail"),
        
      ),
      body: Center(
        child:BlocBuilder<WeatherCubit, WeatherState>(
          bloc: BlocProvider.of<WeatherCubit>(context),
          builder: (context, state) {
            if (state is WeatherLoading){
              return const CircularProgressIndicator();
            }
            if (state is WeatherLoaded) {
              return WeatherInformation(weatherModel: state.weatherModel);
            }
            return const Text ('error');
          }
        )//Text('${cityName} Weather Detail'),

      ),
    );
  }
}
