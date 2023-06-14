# task_management_app
This Task Management Application
1 Structure Use MVVM 
2 List of External package 
- dio: ^4.0.0 (for call api)
- cupertino_icons: ^1.0.2 (for get icon)
- flutter_pin_code_widget: ^0.1.0 (for pin login view )
- flutter_slidable: ^3.0.0 (for slide delete item of listview) 
- local_session_timeout: ^2.3.0 (for session logout)
- intl: ^0.17.0-nullsafety.1 (for get Format datetime)

Fist step you can typing your PIN (123456) on Login Screen
if PIN is correct will take you to Tasks Screen
on this screen you can select Tap "To-do" , "Doing" , "Done" for your Task
and you can load more of the list for another item (default it is 10 items)
Exactly you can delete item by slide item to right side will show Button Delete for delete that item
if you is not action application or isActive your application within 10 seconds
the application will logoff and navigate to Login Screen

