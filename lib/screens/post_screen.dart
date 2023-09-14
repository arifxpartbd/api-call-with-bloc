import 'package:apicallwithbloc/blocs/post_bloc/post_bloc.dart';
import 'package:apicallwithbloc/blocs/post_bloc/post_event.dart';
import 'package:apicallwithbloc/blocs/post_bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPostData());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostDateError) {
            return const Center(
              child: Text("No data found"),
            );
          }
          if (state is PostDataLoaded) {
            final post = state.post;
            return ListView.builder(
                itemCount: post.length,
                itemBuilder: (context, index) {
                  final postlist = post[index];
                  return ListTile(
                    title: Text(postlist.title.toString()),
                    subtitle: Text(postlist.body.toString()),
                  );
                });
          } else {
            return const Center(
              child: Text('No Data Found, try again'),
            );
          }
        },
      ),
    );
  }
}
