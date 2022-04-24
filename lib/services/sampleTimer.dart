class Timer{

  Future<void> getTime() async {
    try {
        await Future.delayed(Duration(seconds: 3), ()
        {
          print('Welcome');
        });
    } catch (e) {
      print('Caught Error: $e');
    }
  }

}