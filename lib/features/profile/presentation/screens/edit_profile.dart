import 'package:flutter/material.dart';
import 'package:movie_app_indvidual/core/sql_model_register.dart';
import 'package:movie_app_indvidual/features/profile/presentation/screens/profile_screen.dart';

import '../../../../core/animateroute.dart';
import '../../../../core/general_account_sql.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: FutureBuilder(
          future: AccountProvider.instance.getAllUsers(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              String initEmail= snapshot.data?.last.email;
              String initUserName = snapshot.data?.last.username;
              String initPassword = snapshot.data?.last.password;
              return Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      SlideRightTransition(
                                          page: const ProfileScreen()));
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.surface,
                                )),
                            Text.rich(TextSpan(
                                text: "Edit Profile",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                children: [
                                  TextSpan(
                                    text: ".",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    ),
                                  )
                                ])),
                            Icon(
                              Icons.person,
                              color: Theme.of(context).colorScheme.surface,
                              size: 45,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Stack(children: [
                            Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: Image.network(
                                      "https://th.bing.com/th/id/OIP.eU8MYLNMRBadK-YgTT6FJQHaHw?rs=1&pid=ImgDetMain",
                                      fit: BoxFit.fill,
                                    ))),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.edit,
                                  size: 25,
                                  color: Theme.of(context).colorScheme.surface,
                                ))
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "UserName:",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your username";
                                    }
                                    return null;
                                  },
                                  //initialValue: initUserName,
                                  controller: username,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: "User Name",
                                    hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).colorScheme.primary,
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                ),
                                Text(
                                  "Email:",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your email";
                                    }
                                    return null;
                                  },
                                  //initialValue: snapshot.data.last.email,
                                  controller: email,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).colorScheme.primary,
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                ),
                                Text(
                                  "Password:",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                  //initialValue: snapshot.data.last.password,
                                  controller: password,
                                  keyboardType: TextInputType.name,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).colorScheme.primary,
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextButton(
                                onPressed: () {
                                  AccountProvider.instance.update(AccountModel(
                                      username: username.text,
                                      email: email.text,
                                      password: password.text));
                                  Navigator.of(context).pushAndRemoveUntil(
                                      SlideRightTransition(
                                          page: const ProfileScreen()),
                                      (route) => false);
                                },
                                child: Text(
                                  "Save Changes",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
