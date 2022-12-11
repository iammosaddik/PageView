//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pageview/Model/News_details_model.dart';
// import 'package:pageview/Repository/news_repo.dart';
//
// import '../Model/Letest_news_model.dart';
// import '../Provider/news_provider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key,}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   final GlobalKey<RefreshIndicatorState> _refreshIndicator=
//   GlobalKey<RefreshIndicatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final PageController controller = PageController();
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Consumer(builder: (_,ref,watch){
//               AsyncValue<LetestNewsModel> letestNews= ref.watch(getLatestNews);
//               return letestNews.when(data: (newsL){
//                 return RefreshIndicator(
//                   key: _refreshIndicator,
//                   onRefresh: (){
//                    return Future.delayed(const Duration(seconds: 2));
//                   },
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: PageView.builder(
//                           controller: controller,
//                           scrollDirection: Axis.vertical,
//                             itemCount: newsL.datas?.data?.length?? 0,
//                             itemBuilder: (_,index){
//                               return SizedBox(
//                                   height: MediaQuery.of(context).size.height,
//                                   child:
//                                   Column(
//                                     children: [
//                                       Stack(
//                                         clipBehavior: Clip.none, children:[
//                                             // Container(height: 320,),
//                                             Container(
//                                               height: 300,
//                                               decoration:  BoxDecoration(
//                                                 color: Colors.blue,
//                                                   image: DecorationImage(
//                                                     image: NetworkImage(newsL.datas?.data?[index].image?[0]?? ''),fit: BoxFit.fill,
//                                                   )
//                                               ),
//                                             ),
//                                             Positioned(
//                                               bottom: -10,
//                                               left: 18,
//                                               child: Container(
//                                                 padding: const EdgeInsets.only(left: 8,right: 8),
//                                                 height: 22,
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius: BorderRadius.circular(15)
//                                                 ),
//                                                 child:  Center(child: Padding(
//                                                   padding: const EdgeInsets.only(left: 5.0,right: 5.0),
//                                                   child: Text(newsL.datas?.data?[index].newsSubcategory?? '',style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
//                                                 )),
//                                               ),
//                                             ),
//                                           ]
//                                       ),
//                                       const SizedBox(height: 10,),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 15.0,right: 40),
//                                         child: Text(newsL.datas?.data?[index].title.toString()?? '',style: const TextStyle(color: Colors.black,fontSize: 20),),
//                                       ),
//                                      Consumer(builder: (_,ref,watch){
//                                        AsyncValue<NewsDetailsModel> getDetails = ref.watch(getDetailsNewsProvider(widget.));
//                                        return getDetails.when(data: (data){
//
//                                        }, error: (e,stack){
//                                          return Text(e.toString());
//                                        }, loading: (){
//                                          return CircularProgressIndicator();
//                                        })
//                                      }),
//                                      // FutureBuilder<NewsDetailsModel>(
//                                      //   future: NewsRepo().getDetails(),
//                                      //     builder: (_,snapshot){
//                                      //     if(snapshot.hasData){
//                                      //       return Container(
//                                      //         child: Text(snapshot.data?.data?.description?? '',style: TextStyle(color: Colors.black),),
//                                      //       );
//                                      //     }else{
//                                      //       return CircularProgressIndicator();
//                                      //     }
//                                      // })
//                                     ],
//                                   )
//                               );
//                             }),
//                       ),
//                     ],
//                   ),
//                 );
//               }, error: (e,stack){
//                 return Text(e.toString());
//               }, loading: (){
//                 return const CircularProgressIndicator();
//               });
//             }),
//         floatingActionButton: FloatingActionButton.extended(onPressed: (){
//           _refreshIndicator.currentState?.show();
//         },
//           icon: const Icon(Icons.refresh),
//           label: const Text('Refresh',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//         ),
//       ),
//     );
//   }
// }
//
//
