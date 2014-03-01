describe "MyService", ->
  it "says hello", ->
    spyOn console, "log"
    new window.MyService().sayHello()
    expect(console.log).toHaveBeenCalledWith("Hello world")
