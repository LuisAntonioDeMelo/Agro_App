import 'package:permission_handler/permission_handler.dart';

//Validar Acesso a camera sem necessitar configurar arquivos de build
Future<bool> isContemPermissoes() async {
  PermissionStatus permissao =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
  if (permissao != PermissionStatus.granted) {
    Map<PermissionGroup, PermissionStatus> permissoes =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);
    return permissoes[PermissionGroup.camera] == PermissionStatus.granted;
  } else {
    return true;
  }
}
