#ifndef APP_COMMONS_HEADER_GUARD
#define APP_COMMONS_HEADER_GUARD

namespace DB {
class UPDatabase;
}

class DeviceManager;
class GroupManager;
class DeviceCalendarManager;
class DeviceHardwareService;
class QZXing;

class GlobalHandle {
public:
    static DB::UPDatabase *getApplicationDB();
    static DeviceManager* deviceManager();
    static GroupManager* groupManager();
    static DeviceCalendarManager* deviceCalendarManager();
    static DeviceHardwareService* deviceHardwareService();
    static QZXing * qzxing();
};

#endif // APP_COMMONS_HEADER_GUARD
