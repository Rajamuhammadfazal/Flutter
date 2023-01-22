import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HoverAmination(
          curve: Curves.fastOutSlowIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Get Started",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(height: 40,),
             Signupform()
            ],
          ),
        ),
      ),
    );
  }
}
class HoverAmination extends StatefulWidget {
  const HoverAmination({Key? key,
    required this.child,
     this.size = const Size(500,500),
     this.hcolor = Colors.lightGreen,
     this.bgcolor = const Color(0xFFE9EFF3),
     this.duration =const Duration(milliseconds: 400),
     this.curve = Curves.easeOutBack,
    this.offset = const Offset(8, 8),
    this.border = const Border()
  }) : super(key: key);

  final Widget child;
  final Size size;
  final Color hcolor,bgcolor;
  final Duration duration;
  final Curve curve;
  final Offset offset;

  final Border border;
  @override
  State<HoverAmination> createState() => _HoverAminationState();
}

class _HoverAminationState extends State<HoverAmination> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return(
        Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: widget.size.height,
                width: widget.size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(13))
                ),
              ),
              AnimatedPositioned(
                curve: widget.curve,
                duration: widget.duration,
                top: _hover? -widget.offset.dy : 0,
                right: _hover? widget.offset.dx : 0,
                child: InkWell(
                  onTap: () {},
                  onHover: (hover){
                    setState(() {
                      _hover =hover;
                    });
                  },
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: widget.size.height,
                    width: widget.size.width,
                    decoration: BoxDecoration(
                      color: _hover? widget.hcolor: widget.bgcolor,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: widget.border
                    ),
                    child: widget.child,
                  ),
                ),
              )
            ],
          )
    );
  }
}
class Signupform extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return( SizedBox(
      width: 360,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: HoverAmination(
                size: Size(360,56),
                hcolor: Colors.white,
                bgcolor: Colors.white,
                border: Border.all(),
                offset: Offset(6,6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                  child: TextFormField(
                    onSaved: (name)
                    {},
                    decoration: InputDecoration(hintText: "Enter the name",),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: HoverAmination(
                size: Size(360,56),
                hcolor: Colors.white,
                bgcolor: Colors.white,
                border: Border.all(),
                offset: Offset(6,6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                  child: TextFormField(
                    onSaved: (email)
                    {},
                    decoration: InputDecoration(hintText: "Enter the Email",),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: HoverAmination(
                size: Size(360,56),
                hcolor: Colors.white,
                bgcolor: Colors.white,
                border: Border.all(),
                offset: Offset(6,6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                  child: TextFormField(
                    onSaved: (password)
                    {},
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Enter the Password",),
                  ),
                ),
              ),
            ),
            HoverAmination(
              size: Size(88,48),
              curve: Curves.fastOutSlowIn,
              offset: Offset(6,6),
              child: ElevatedButton(
                  onPressed: (){

              },
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF556124),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    foregroundColor: Color(0xFFD9E1BE),
                    elevation: 0,
                    minimumSize: Size(88, 48),
                  ),
                  child: Text("Sign up")),
            )
          ],
        ),
      ),
    ));
  }

}