import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/infinite_list+login/posts/view/posts_list.dart';
import 'package:http/http.dart' as http;

import '../../authentication/bloc/authentication_bloc.dart';
import '../bloc/post_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PostsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      //we use BlocProvider to create and provide an instance of PostBloc to the subtree.
      // Also, we add a PostFetched event so that when the app loads, it requests the initial batch of Posts.
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(children: [
            Builder(
              builder: (context) {
                //context.select((AuthenticationBloc bloc) => bloc.state.user.id)
                // will trigger updates if the user id changes.
                final userId = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.id,
                );
                return Text('UserID: $userId');
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ]),
          Expanded(
            child: BlocProvider(
              create: (_) =>
                  PostBloc(httpClient: http.Client())..add(PostFetched()),
              child: const PostsList(),
            ),
          ),
        ],
      ),
    );
  }
}
