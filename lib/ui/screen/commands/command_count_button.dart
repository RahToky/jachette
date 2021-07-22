import 'package:bluekango/callback/command_add_listener.dart';
import 'package:flutter/material.dart';

class CommandCountBtn extends StatefulWidget {

  int commandId;
  AddCommandListener addCommandListener;
  int count;
  CommandCountBtn({@required this.commandId,this.count = 0,this.addCommandListener});

  @override
  _CommandCountBtnState createState() => _CommandCountBtnState();
}

class _CommandCountBtnState extends State<CommandCountBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.count > 0)
          IconButton(
            icon: Image.asset('assets/icons/icon_moins.png', scale: 1.2),
            onPressed: () {
              setState(() {
                widget.count --;
                if(widget.addCommandListener != null)
                  widget.addCommandListener.onRemove(widget.commandId,widget.count);
              });},
          ),
        if(widget.count > 0)Text('${widget.count}'),
        IconButton(
          icon: Image.asset('assets/icons/icon_plus.png', scale: 1.2),
          onPressed: () {
            setState(() {
              widget.count ++;
              if(widget.addCommandListener != null)
                widget.addCommandListener.onAdd(widget.commandId,widget.count);
            });
          },
        ),
      ],
    );
  }
}
