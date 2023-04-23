// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyldc_v3/app/cubit/api/bloc/api_test_bloc.dart';
import 'package:tyldc_v3/app/cubit/api/bloc/api_test_state.dart';
import 'package:tyldc_v3/app/cubit/test_list/test_list_cubit.dart';
import 'package:tyldc_v3/app/model/test_list_model.dart';
import '../cubit/api/bloc/api_test_event.dart';
import '../cubit/counter/counter_cubit.dart';

class CounterView extends StatefulWidget {
  static const routeName = '/';
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  var nameCtl = TextEditingController();
  var emailCtl = TextEditingController();
  var ageCtl = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiTestBloc>(context).add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
          return Text(
            state.age.toString(),
          );
        }),
      ),
      body: BlocBuilder<TestListCubit, TestListState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                state.listOfTestData.isEmpty
                    ? const Center(
                        child: Text(
                          'No data here',
                          style: TextStyle(color: Colors.white, fontSize: 100),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.listOfTestData.length,
                        itemBuilder: (_, i) => ListTile(
                              title: Text(state.listOfTestData[i].name),
                              subtitle: Text(state.listOfTestData[i].email),
                              leading: Text(i.toString()),
                              trailing: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<TestListCubit>(context)
                                        .removeUser(state.listOfTestData[i]);
                                  },
                                  icon: const Icon(Icons.delete)),
                            )),
                const Divider(),
                BlocBuilder<ApiTestBloc, ApiTestState>(
                  builder: (context, state) {
                    return state.apiDataList.isEmpty
                        ? const Center(
                            child: Text(
                              'No Api data here',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 100),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.apiDataList.length,
                            itemBuilder: (_, i) => ListTile(
                                  title: Text(state.apiDataList[i].title),
                                  subtitle: Text(
                                      state.apiDataList[i].userId.toString()),
                                  leading:
                                      Text(state.apiDataList[i].id.toString()),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete)),
                                ));
                  },
                ),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<ApiTestBloc>(context).add(FetchData());
                    },
                    child: const Text('load Data'))
              ],
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                  label: Row(
                    children: const [Text('Add Int'), Icon(Icons.add)],
                  ),
                  onPressed: (() {
                    BlocProvider.of<CounterCubit>(context).increment();
                    log(BlocProvider.of<CounterCubit>(context)
                        .state
                        .height
                        .toString());
                  })),
              FloatingActionButton.extended(
                  label: Row(
                    children: const [Text('Remove Int'), Icon(Icons.remove)],
                  ),
                  onPressed: (() {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    log(BlocProvider.of<CounterCubit>(context)
                        .state
                        .height
                        .toString());
                  })),
              FloatingActionButton.extended(
                  label: Row(
                    children: const [
                      Text('Add User'),
                      Icon(Icons.person_add_alt_1_rounded)
                    ],
                  ),
                  onPressed: (() {
                    String name = '';
                    int age = 0;
                    String email = '';
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Form(
                                  child: Column(
                                children: [
                                  TextField(
                                    decoration:
                                        const InputDecoration(hintText: 'name'),
                                    controller: nameCtl,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                        hintText: 'email'),
                                    controller: emailCtl,
                                  ),
                                  TextField(
                                    decoration:
                                        const InputDecoration(hintText: 'age'),
                                    controller: ageCtl,
                                  ),
                                ],
                              )),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        age = int.parse(ageCtl.text);
                                        name = nameCtl.text;
                                        email = emailCtl.text;
                                      });
                                    },
                                    child: const Text('Update')),
                                TextButton(
                                    onPressed: () async {
                                      Future.delayed(Duration.zero);
                                      BlocProvider.of<TestListCubit>(context)
                                          .addUser(TestDataModel(
                                              age: age,
                                              email: email,
                                              name: name));
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Add'))
                              ],
                            ));
                    log(BlocProvider.of<TestListCubit>(context)
                        .state
                        .listOfTestData
                        .length
                        .toString());
                  })),
            ],
          );
        },
      ),
    );
  }
}
