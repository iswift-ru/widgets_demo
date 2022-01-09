import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_demo/utils/global_theme.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum SkillLevel { junior, middle, senior }

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _confirmAgreement = true;
  SkillLevel? _skillLevel = SkillLevel.junior;

  void _onCheckedChange(bool? val) {
    setState(() {
      _checked = !_checked;
    });
  }

  void _onSkillLevel(SkillLevel? value) {
    setState(() {
      _skillLevel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
        home: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(children: [
                Row(
                  children: [
                    Checkbox(
                        value: _checked,
                        onChanged: (val) {
                          setState(() {
                            _checked = !_checked;
                          });
                        }),
                    Text("Выбор")
                  ],
                ),
                CheckboxListTile(
                    title: Text("Принять условия соглашения"),
                    value: _confirmAgreement,
                    onChanged: _onCheckedChange),
                Row(
                  children: [
                    Switch(value: _checked, onChanged: _onCheckedChange),
                    const Text("Включить"),
                  ],
                ),
                SwitchListTile(
                    title: const Text("Включить"),
                    value: _checked,
                    onChanged: _onCheckedChange),
                const Text("Уровень знаний"),
                RadioListTile<SkillLevel>(
                    title: const Text("Junior"),
                    value: SkillLevel.junior,
                    groupValue: _skillLevel,
                    onChanged: _onSkillLevel),
                RadioListTile<SkillLevel>(
                  title: const Text("Middle"),
                  value: SkillLevel.middle,
                  groupValue: _skillLevel,
                  onChanged: _onSkillLevel,
                ),
                RadioListTile<SkillLevel>(
                  title: const Text("Middle"),
                  value: SkillLevel.senior,
                  groupValue: _skillLevel,
                  onChanged: _onSkillLevel,
                ),
              ]),
            )));
  }
}
