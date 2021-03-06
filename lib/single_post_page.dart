import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/post_api_service.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;

  const SinglePostPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper Blog'),
      ),
      body: FutureBuilder<Response>(
        future: Provider.of<PostApiService>(context).getPost(postId),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            final Map post = json.decode(snapshot.data!.bodyString);
            return _buildPost(post);
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  Widget _buildPost(Map<dynamic, dynamic> post) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(post['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
        ),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(post['body'])),
        ),
      ],
    );
  }
}
