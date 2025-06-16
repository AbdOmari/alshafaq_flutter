import 'dart:io';
import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/image_picker/image_picker_cubit/image_picker_cubit.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({
    super.key,
    required this.label,
    required this.onCompleted,
  });
  final String label;
  final void Function(File image)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              const SizedBox(height: 5),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManger.primaryColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: InkWell(
                  onTap: () {
                    context.read<ImagePickerCubit>().pickImage(
                      fromCamera: false,
                    );
                  },
                  child: Center(
                    child: BlocConsumer<ImagePickerCubit, File?>(
                      listener: (context, state) {
                        if (state != null) {
                          onCompleted?.call(state);
                        }
                      },
                      builder: (context, state) {
                        if (state == null) {
                          return Image.asset(
                            ImageManger.addImage,
                            height: 100,
                            width: 100,
                          );
                        }
                        return ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          child: Image.file(
                            state,
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
