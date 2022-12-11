

import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicator=
  GlobalKey<RefreshIndicatorState>();

  List<String> description =[
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using .Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)',
    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32',
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
  ];
  List<String> titles =[
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'It is a long established fact that a reader will be distracted by the readable content of a page',
    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical',
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered ',
  ];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          key: _refreshIndicator,
          color: Colors.white,
          backgroundColor: Colors.blue,
          strokeWidth: 4.0,
          onRefresh: ()async{
            await Future<void>.delayed(const Duration(seconds: 1));
          },
          child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (_,index){
                // return Consumer(builder: (_,ref,watch){
                //   AsyncValue<LetestNewsModel> letestNews= ref.watch(getLatestNews);
                //   return letestNews.when(data: (newsL){
                //   }, error: (e,stack){
                //     return Text(e.toString());
                //   }, loading: (){
                //     return CircularProgressIndicator();
                //   });
                // });
                return ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (_,index){
                      return Column(
                        children: [
                          Stack(
                              children:[
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                ),
                                Container(
                                  height: 300,
                                  decoration:  BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/america.jpg'),fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                Positioned(
                                  top: 290,
                                  left: 18,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8,right: 8),
                                    height: 22,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child:  Center(child: Padding(
                                      padding: EdgeInsets.only(left: 5.0,right: 5.0),
                                      child: Text('inshot',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                    )),
                                  ),
                                ),
                              ]
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0,right: 40),
                            child: Text(titles[index],style: TextStyle(color: Colors.black,fontSize: 20),),
                          ),
                        ],
                      );
                    });
              }),
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: (){
          _refreshIndicator.currentState?.show();
        },
          icon: Icon(Icons.refresh),
          label: Text('Search',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
