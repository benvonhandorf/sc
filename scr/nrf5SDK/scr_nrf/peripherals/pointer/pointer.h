#ifndef POINTER_H_
#define POINTER_H_

class Pointer {
public:
  virtual bool isBusy() = 0;

  virtual bool Initialize() = 0;
  virtual bool isInitialized() = 0;

  virtual bool Poll() = 0;
  virtual bool hasData() = 0;

  virtual int8_t getX() = 0;
  virtual int8_t getY() = 0;
};

#endif