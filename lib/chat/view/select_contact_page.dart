import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protask/chat/chat.dart';
import 'package:protask/chat/models/models.dart';
import 'package:protask/chat/view/chat_page.dart';
import 'package:protask/models/user.dart';
import 'package:protask/repo/user_repo.dart';
import 'package:protask/users/bloc/users_bloc.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({Key? key}) : super(key: key);

  static const route = '/selectcontact';

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(repo: UserRepo())..add(GetUsers()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              //backgroundColor: Colors.white,
              title: Text('Select contact'),
              pinned: true,
              floating: true,
              elevation: 0,
              /* bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[100],
                      ),
                      child: const TextField(
                        /* style: TextStyle(
                          color: Colors.white,
                        ), */
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            maxHeight: 40,
                          ),
                          icon: Icon(
                            Icons.search,
                            //color: Colors.white,
                          ),
                          hintText: 'Search...',
                          /* hintStyle: TextStyle(
                            color: Colors.white,
                          ), */
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ), */
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 24,
                    child: Icon(Icons.people_outline_outlined),
                    //backgroundImage: NetworkImage(chatsData[index].image),
                  ),
                  title: const Text(
                    'New team',
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    /* Navigator.pushReplacementNamed(
                          context, SelectMembersPage.route); */
                  },
                ),
              ),
            ),
            BlocConsumer<UsersBloc, UsersState>(
              listener: (context, state) {
                if (state is UsersError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is UsersLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Contact(user: state.users[index]);
                      },
                      childCount: state.users.length,
                    ),
                  );
                }

                if (state is UsersEmpty) {
                  return const SliverToBoxAdapter(
                    child: Text('No contacts'),
                  );
                }

                if (state is UsersLoading) {
                  return const SliverToBoxAdapter(
                    child: Text('Loading'),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  final User user;
  const Contact({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey,
        //backgroundImage: NetworkImage(chatsData[index].image),
        child: Text(
          "${user.firstname[0]}${user.lastname[0]}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      title: Text(
        "${user.firstname} ${user.lastname}",
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(user.email),
      onTap: () {
        //final

        Navigator.pushReplacementNamed(
          context,
          ChatPage.route,
          //arguments: const ChatArgs(),
        );
      },
    );
  }
}
