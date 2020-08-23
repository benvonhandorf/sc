

class StatusIndicator {
public:
  StatusIndicator();

  void initialize();

  void latchSet();
  void latchCleared();

  void advertisingStarted();
  void bindingComplete();

  void initializationComplete();

private:
  bool latch_set = false;
};