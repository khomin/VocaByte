package com.vocabyte

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.reactivex.disposables.CompositeDisposable

class MainActivity: FlutterActivity() {
    private val devChannel = "dev/channelCmd"
    private val evChannel = "dev/channelEvent"
    private val eventCbMethod = "eventCbRaw"
    private var channelEvent: MethodChannel? =null
    private val disposable = CompositeDisposable()
    private val tag = "MainActivity"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

//        channelEvent = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, evChannel)
//        MethodChannel(
//            flutterEngine.dartExecutor.binaryMessenger,
//            devChannel
//        ).setMethodCallHandler { call, result ->
//            val mt = "methodCallHandler"
//            val args = call.arguments as HashMap<*, *>
//            val data = args["data"] as ByteArray
//            try {
//                val ev = VpnReqMsg.parseFrom(data)
//                when (ev.type) {
//                    VpnReqMsgType.EchoReq -> {
//                        Log.i(tag, "$mt: test message")
//                    }
//                    VpnReqMsgType.StartVPN -> {
//                        Log.i(tag, "$mt: start vpn")
//                        val mIntent = Intent(this, TunaService::class.java)
//                        val mBundle = Bundle()
//                        mBundle.putByteArray("data", ev.startVpnData.toByteArray())
//                        mIntent.putExtras(mBundle)
//                        mIntent.action = TunaService.ACTION_CONNECT
//                        intentToStart = mIntent
//                        prepareVpn()
//                    }
//                    VpnReqMsgType.StopVPN -> {
//                        Log.i(tag, "$mt: stop vpn")
//                        startService(
//                            Intent(this, TunaService::class.java)
//                                .setAction(TunaService.ACTION_DISCONNECT)
//                        )
//                        // send 'closed' event status to flutter
//                        val evR = EventData.newBuilder()
//                        evR.evId = EventID.EVENT_STATE_CHANGE
//                        val state = EventStateChange.newBuilder()
//                        state.mNewState = IMainClientState.Closed
//                        state.mOldState = IMainClientState.Closed
//                        evR.setStateChanged(state)
//                        val evSerialized = Convert().eventDataToData(evR.build())
//                        channelEvent?.invokeMethod(eventCbMethod, evSerialized)
//                    }
//                    VpnReqMsgType.GetEvents -> {
//                        Log.i(tag, "$mt: get-state-evens")
//                        startService(
//                            Intent(this, TunaService::class.java)
//                                .setAction(TunaService.ACTION_RESEND_STATE)
//                        )
//                    }
//                    VpnReqMsgType.ApplyUpdateWithRestart -> {
//                        val intent = Intent(Intent.ACTION_VIEW)
//                        val fileUri: Uri = FileProvider.getUriForFile(
//                            this,
//                            BuildConfig.APPLICATION_ID + ".provider",
//                            File(ev.applyUpdate.path)
//                        )
//                        intent.setDataAndType(fileUri, "application/vnd.android.package-archive")
//                        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
//                        intent.addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
//                        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK)
//                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
//                        startActivity(intent)
//                        finishAndRemoveTask();
//                    }
//                    VpnReqMsgType.DestroyService -> {
//                        Log.i(tag, "$mt: destroy service")
//                        stopService(Intent(this, TunaService::class.java))
//                    }
//                    else -> {}
//                }
//            } catch (e: Exception) {
//                Log.e(tag, "Error registering plugin", e)
//            }
//            result.success(true)
//        }
    }

    override fun onDestroy() {
        super.onDestroy()
        disposable.clear()
    }
}
