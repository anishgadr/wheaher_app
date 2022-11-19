import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:whether_app/wheather/wheather/wheather_cubit.dart';
import 'package:whether_app/wheather/widget/extra_widget.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<WheatherCubit>(context).loadWheatherData();
    final now = DateTime.now();
    String formatter = DateFormat.yMMMMd().format(now); // 28/03/2020
    return GlowContainer(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 150,
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: const Color(0xff556bf9).withOpacity(0.5),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      color: const Color(0xff556bf9),
      spreadRadius: 5,
      child: BlocConsumer<WheatherCubit, WheatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WheatherLoading) {
            return const Center(
                child: SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    )));
          } else if (state is WheatherDataLoaded) {
            final data = (state).data;
            return Column(
              children: [
                Text(
                  data!.timezone,
                  style: const TextStyle(
                      height: 0.1,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/images/rainy.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 20,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Column(
                            children: [
                              GlowText(
                                "${data.current.temp}°C",
                                style: const TextStyle(
                                  height: 0.1,
                                  fontSize: 80,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data.current.weather[0].description,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                formatter,
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(color: Colors.white),
                const SizedBox(height: 10),
                ExtraWeather(data: data),
              ],
            );
          } else if (state is WheatherErrorState) {
            return Text(state.msg);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
