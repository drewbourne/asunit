package asunit4.support {

    import asunit4.framework.IRunner;
    import asunit4.framework.IResult;
    import asunit4.framework.TestSuccess;

    import flash.events.EventDispatcher;
    import flash.display.DisplayObjectContainer;

    public class FakeRunner extends EventDispatcher implements IRunner {

		public function run(item:Class, result:IResult, visualContext:DisplayObjectContainer=null):void {
            var currentTest:TestForFakeRunner = new item() as TestForFakeRunner;
            var value:int = currentTest.customTestMethod();

            result.onTestStarted(currentTest);
            result.onTestSuccess(new TestSuccess(currentTest, 'customTestMethod'));
            result.onTestCompleted(currentTest);
        }
    }
}
