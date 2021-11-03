import 'package:appquiztory/services/auth_service.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActualHome extends StatefulWidget {
  const ActualHome({Key? key}) : super(key: key); // edited

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<ActualHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // return StreamBuilder<UsersRecord>(
    //   stream: UsersRecord.getDocument(currentUserReference),
    //   builder: (context, snapshot) {
    //     // Customize what your widget looks like when it's loading.
    //     if (!snapshot.hasData) {
    //       return Center(
    //         child: SizedBox(
    //           width: 50,
    //           height: 50,
    //           child: CircularProgressIndicator(
    //             color: FlutterFlowTheme.primaryColor,
    //           ),
    //         ),
    //       );
    //     }
    // final homePageUsersRecord = snapshot.data;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B39EF),
        automaticallyImplyLeading: false,
        title: Builder(builder: (context) {
          return const Text(
            'DEVELOPED BY:',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProfileAvatar(
//                  'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWtMDksH9GzFdMinyAkGbtLJNx6xynLETTNN5akjxirL3QD5Rj',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const MyProfileScreen()));
                    },
                    placeHolder: (context, url) => const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    ),
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    borderWidth: 5,
                    initialsText: const Text(
                      "AD",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    borderColor: Colors.red,
                    imageFit: BoxFit.fitHeight,
                    elevation: 5.0,
                    cacheImage: true,
                    showInitialTextAbovePicture: false,
                  ),
                )
              ],
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: const Color(0xFF4B39EF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: const Color(0xFF4B39EF),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/wavesMiddle@3x.png',
            ).image,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/quiztorylogo.png',
                      width: 300,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Dailyrewards()));
                        // onPressed: () async {
                        //                         setState(() => _loadingButton1 = true);
                        //                         try {
                        //                           await Navigator.pushAndRemoveUntil(
                        //                             context,
                        //                             PageTransition(
                        //                               type: PageTransitionType.rightToLeft,
                        //                               duration: Duration(milliseconds: 300),
                        //                               reverseDuration: Duration(milliseconds: 300),
                        //                               child: ContentpageWidget(),
                      },
                      child: const Text(
                        'Play',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20),
                          shape: const StadiumBorder()),
                    )
                    // FFButtonWidget(
                    //   onPressed: () async {
                    //     setState(() => _loadingButton1 = true);
                    //     try {
                    //       await Navigator.pushAndRemoveUntil(
                    //         context,
                    //         PageTransition(
                    //           type: PageTransitionType.rightToLeft,
                    //           duration: Duration(milliseconds: 300),
                    //           reverseDuration: Duration(milliseconds: 300),
                    //           child: ContentpageWidget(),
                    //         ),
                    //         (r) => false,
                    //       );
                    //     } finally {
                    //       setState(() => _loadingButton1 = false);
                    //     }
                    //   },
                    //   text: 'PLAY',
                    //   options: FFButtonOptions(
                    //     width: 250,
                    //     height: 50,
                    //     color: FlutterFlowTheme.primaryColor,
                    //     textStyle: FlutterFlowTheme.title1.override(
                    //       fontFamily: 'Poppins',
                    //       color: FlutterFlowTheme.tertiaryColor,
                    //       fontSize: 30,
                    //     ),
                    //     elevation: 15,
                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 20,
                    //   ),
                    //   loading: _loadingButton1,
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // onPressed: () async {
                        //                         setState(() => _loadingButton1 = true);
                        //                         try {
                        //                           await Navigator.pushAndRemoveUntil(
                        //                             context,
                        //                             PageTransition(
                        //                               type: PageTransitionType.rightToLeft,
                        //                               duration: Duration(milliseconds: 300),
                        //                               reverseDuration: Duration(milliseconds: 300),
                        //                               child: ContentpageWidget(),
                      },
                      child: const Text(
                        'Tournament',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20),
                          shape: const StadiumBorder()),
                    )
                    // FFButtonWidget(
                    //   onPressed: () async {
                    //     setState(() => _loadingButton2 = true);
                    //     try {
                    //       await Navigator.push(
                    //         context,
                    //         PageTransition(
                    //           type: PageTransitionType.rightToLeft,
                    //           duration: Duration(milliseconds: 200),
                    //           reverseDuration: Duration(milliseconds: 200),
                    //           child: TournapageWidget(),
                    //         ),
                    //       );
                    //     } finally {
                    //       setState(() => _loadingButton2 = false);
                    //     }
                    //   },
                    //   text: 'TOURNAMENT',
                    //   options: FFButtonOptions(
                    //     width: 250,
                    //     height: 50,
                    //     color: FlutterFlowTheme.primaryColor,
                    //     textStyle: FlutterFlowTheme.title1.override(
                    //       fontFamily: 'Poppins',
                    //       color: FlutterFlowTheme.tertiaryColor,
                    //       fontSize: 30,
                    //     ),
                    //     elevation: 15,
                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 20,
                    //   ),
                    //   loading: _loadingButton2,
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // onPressed: () async {
                        //                         setState(() => _loadingButton1 = true);
                        //                         try {
                        //                           await Navigator.pushAndRemoveUntil(
                        //                             context,
                        //                             PageTransition(
                        //                               type: PageTransitionType.rightToLeft,
                        //                               duration: Duration(milliseconds: 300),
                        //                               reverseDuration: Duration(milliseconds: 300),
                        //                               child: ContentpageWidget(),
                      },
                      child: const Text(
                        'Analytics',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20),
                          shape: const StadiumBorder()),
                    )
                    // FFButtonWidget(
                    //   onPressed: () {
                    //     print('Button pressed ...');
                    //   },
                    //   text: 'ANALYTICS',
                    //   options: FFButtonOptions(
                    //     width: 250,
                    //     height: 50,
                    //     color: FlutterFlowTheme.primaryColor,
                    //     textStyle: FlutterFlowTheme.title1.override(
                    //       fontFamily: 'Poppins',
                    //       color: FlutterFlowTheme.tertiaryColor,
                    //       fontSize: 30,
                    //     ),
                    //     elevation: 15,
                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 20,
                    //   ),
                    //   loading: _loadingButton3,
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const settings()));
                        // onPressed: () async {
                        //                         setState(() => _loadingButton1 = true);
                        //                         try {
                        //                           await Navigator.pushAndRemoveUntil(
                        //                             context,
                        //                             PageTransition(
                        //                               type: PageTransitionType.rightToLeft,
                        //                               duration: Duration(milliseconds: 300),
                        //                               reverseDuration: Duration(milliseconds: 300),
                        //                               child: ContentpageWidget(),
                      },
                      child: const Text(
                        'Settings',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20),
                          shape: const StadiumBorder()),
                    )
                    // FFButtonWidget(
                    //   onPressed: () async {
                    //     setState(() => _loadingButton4 = true);
                    //     try {
                    //       await Navigator.push(
                    //         context,
                    //         PageTransition(
                    //           type: PageTransitionType.rightToLeft,
                    //           duration: Duration(milliseconds: 200),
                    //           reverseDuration: Duration(milliseconds: 200),
                    //           child: AppsettingsWidget(),
                    //         ),
                    //       );
                    //     } finally {
                    //       setState(() => _loadingButton4 = false);
                    //     }
                    //   },
                    //   text: 'SETTINGS',
                    //   options: FFButtonOptions(
                    //     width: 250,
                    //     height: 50,
                    //     color: FlutterFlowTheme.primaryColor,
                    //     textStyle: FlutterFlowTheme.title1.override(
                    //       fontFamily: 'Poppins',
                    //       color: FlutterFlowTheme.tertiaryColor,
                    //       fontSize: 30,
                    //     ),
                    //     elevation: 15,
                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 20,
                    //   ),
                    //   loading: _loadingButton4,
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async{
                        await authService.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/SplashScreen', (Route<dynamic> route) => false);
                        // onPressed: () async {
                        //                         setState(() => _loadingButton1 = true);
                        //                         try {
                        //                           await Navigator.pushAndRemoveUntil(
                        //                             context,
                        //                             PageTransition(
                        //                               type: PageTransitionType.rightToLeft,
                        //                               duration: Duration(milliseconds: 300),
                        //                               reverseDuration: Duration(milliseconds: 300),
                        //                               child: ContentpageWidget(),
                      },
                      child: const Text(
                        'Exit Game',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20),
                          shape: const StadiumBorder()),
                    )
                    // FFButtonWidget(
                    //   onPressed: () async {
                    //     setState(() => _loadingButton5 = true);
                    //     try {
                    //       await showModalBottomSheet(
                    //         isScrollControlled: true,
                    //         context: context,
                    //         builder: (context) {
                    //           return ExitgameWidget();
                    //         },
                    //       );
                    //     } finally {
                    //       setState(() => _loadingButton5 = false);
                    //     }
                    //   },
                    //   text: 'EXIT GAME',
                    //   options: FFButtonOptions(
                    //     width: 250,
                    //     height: 50,
                    //     color: FlutterFlowTheme.primaryColor,
                    //     textStyle: FlutterFlowTheme.title1.override(
                    //       fontFamily: 'Poppins',
                    //       color: FlutterFlowTheme.tertiaryColor,
                    //       fontSize: 30,
                    //     ),
                    //     elevation: 15,
                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 20,
                    //   ),
                    //   loading: _loadingButton5,
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      return const Text(
                        'DEVELOPED BY:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      );
                    })
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/0402d5b772f14be394dcd6441b98132f.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
