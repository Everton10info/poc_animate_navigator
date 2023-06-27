// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomStep extends StatelessWidget {
  final int numberSteps;
  final double withSize;
  final int activated;
  final int index;
  final String stepName;

  const CustomStep({
    Key? key,
    required this.numberSteps,
    required this.withSize,
    required this.activated,
    required this.index,
    required this.stepName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: const Color(0xffCCCCCC),
            ),
            color: activated > index ? Colors.orange : Colors.white,
            shape: BoxShape.circle,
          ),
          child: index < activated - 1
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 10,
                )
              : Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 10,
                    color: activated == index + 1
                        ? Colors.white
                        : const Color(0xffCCCCCC),
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: SizedBox(
            width: withSize / numberSteps,
            child: Text(
              textAlign: TextAlign.center,
              stepName,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xffCCCCCC),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomStepper extends StatefulWidget {
  final int activated;
  final double withSize;
  final List<String> steps;
  const CustomStepper({
    Key? key,
    required this.activated,
    required this.withSize,
    required this.steps,
  }) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    final size = widget.withSize * 0.85;
    return FittedBox(
      fit: BoxFit.fill,
      child: SizedBox(
        height: 60,
        width: widget.withSize,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(alignment: Alignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: SizedBox(
                  width: size,
                  child: LinearProgressIndicator(
                    minHeight: 2,
                    value: (widget.activated - 1) / (widget.steps.length - 1),
                    color: Colors.orange,
                    backgroundColor: const Color(0xffCCCCCC),
                  ),
                ),
              ),
              SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.steps.length,
                    itemBuilder: (context, index) {
                      return CustomStep(
                        numberSteps: widget.steps.length,
                        withSize: widget.withSize,
                        activated: widget.activated,
                        index: index,
                        stepName: widget.steps[index],
                      );
                    },
                  ))
            ]),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
