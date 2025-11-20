import 'package:flutter_hooks/flutter_hooks.dart';

bool Function() useIsMountedd() {
  final isMounted = useRef(true);

  useEffect(() {
    isMounted.value = true;
    return () => isMounted.value = false;
  }, []);

  return () => isMounted.value;
}
