Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5E44C2AA1E5
	for <lists+linux-audit@lfdr.de>; Sat,  7 Nov 2020 01:52:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-nTAZHPDiMAOYwJ9GfXpx8w-1; Fri, 06 Nov 2020 19:52:26 -0500
X-MC-Unique: nTAZHPDiMAOYwJ9GfXpx8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03B1584BA14;
	Sat,  7 Nov 2020 00:52:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 087A018E4A;
	Sat,  7 Nov 2020 00:52:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DC1A922FE;
	Sat,  7 Nov 2020 00:52:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A70q7Di002422 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Nov 2020 19:52:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3A0DF6420; Sat,  7 Nov 2020 00:52:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E05FF6404
	for <linux-audit@redhat.com>; Sat,  7 Nov 2020 00:52:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F173801224
	for <linux-audit@redhat.com>; Sat,  7 Nov 2020 00:52:04 +0000 (UTC)
Received: from sonic313-15.consmr.mail.ne1.yahoo.com
	(sonic313-15.consmr.mail.ne1.yahoo.com [66.163.185.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-148-mjHpGXguMeqdYmxXPe8STw-1;
	Fri, 06 Nov 2020 19:52:02 -0500
X-MC-Unique: mjHpGXguMeqdYmxXPe8STw-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1604710321; bh=TABCm7M5QKOWd8kDdRljCUnh+vBXuhY2x5Np8ugwmIg=;
	h=To:From:Subject:Date;
	b=hk2iPqJUdlgKE2cQi6meGw6eLAGxJfE8tPjLWVFclHDdzWkUss/p2XPoGemdkFd2u/Z4vq4yeY7fWWMe+MmfLtpnXQR/dwWy3XdVnfwjrlYiHb7/KiRMkAUbMxNoEcv3VzuzD5EIQdCDbp5hx1JPHfgn5HkRR4qPaYXXHYS0/oRS5/4w63TKP1K2Iq4MQ95pOoVwIs8j2SNPDiLOd2tUVZPus9Y6LIwzbhE30o0qrwAtxrHMNu94vP5BJIZI1wnyB4hGvbR8nhUIRNHWwXtvq5VQIM+PcnZriLTwCfdSLc4cIacm+uqvfRrwrsGsl5pIPmC0beZd11m71QUDh+UQRg==
X-YMail-OSG: F5DNcBUVM1kuOSFXUPgPAd.Nkto7M_G731y2Asy2IeGGhj23p996yW_Sf9ePBb1
	X8Ve81185AGx58aIMERzqd7j8h9e_MI2.fCkxosJd_L5pPYZWR6FeLDXAk4wRTr_9OFdfv_h3Ju6
	pWKP5sDoOjTQrESwvUW6yd6P64BBW0L6ascdbEu2rvEscdOsf1m8RdhG238eBPUw_7p8IYdZlPzv
	pELqA.PNIS4IJm8RFwOJp951ux9WCd3bXoXLflHRcuMyjds_Bsw5CFhaRrjMlyQUx1DIH2AQ56rG
	.RUIbr3VAklNFE0XCGf1lHwBMOgmJY7pJ4l.8NUgiCh0QGO04JOT91j8fXCA3vR8wOUlyFBDnwE1
	Yw2GEoz3CDZl9X.tpLBn5i6Nl30pDrUm6EDJ.uBBTh3SvJYn8RYSB2mb.gchfCOMb.HfmVgZtyeU
	l4j0WWk0fbYFBbMLCF5NWy3ioqI9w_WLMKZeooa2.KAauuTnE0O610Lh.L63OjeRM3B9eIydFr6R
	AYDWd2VWBdRycfOlZstS2Cw5sj2CkqdIuOnWZQaod_ySnepbeKvmzhttW6JsmwN5bC7phN3MPSyZ
	gzM4ZZMlySrPr7SCZ6qlrNztf6OqAdUu3oppZ2a.6wEWill35drWj1NLsgZErckcFN4DpA5DxI8E
	uEeWqwTde5RYEDDbcnpHxrY6_U7z2QR.aEMmn6u5PR.f9rVaaaE71h6adM9RWF08TBHJWIZ8F3OO
	ZHiKlQTpBTSNX55MMLj5oI3622BadI.7KOBnhZiHSkbRepgKrGcfznI0PwXGuC34FNYLYv_ZOA5n
	jbvPCJ9Cif3cRfFV1Z6qDZwIbQuGxXjKnCu2XlzW9245TxfxFTbX6oC.bGwkYLcUN5KM6RvtT2Xa
	EobKoZLiPiTMXrZfrVcTW3UjBE2.IZctDTGZNoP8yFG25rJuI4vFaw0Etshz29rGGJxLG5q0UAnX
	vHfdlDhTr7C_07krKLhG6Tt8IKu0h21crG2yV3hbM7NT5no7AcbpFD.hWNIqEKVrNiB14o7yMcsi
	XUMym_2hrSssniMTcTjjn1VeCDCZ8hvFc5BfM3gC_w5FT4Qqp33toM3Feds6M6uo9qWGbynZ_Hj3
	YM.TazjMwcP6Qyjrp4hDx9APT91vumUfuYu0T_g.Oj9szNc1iUaITGTt3QW9DdRXMgkRz.S7VlgZ
	l8k0QUmQExCzFhRufBZze4jONL845lTVwRoF_6IDJ6.Osmb_R82gx9Ga0WwibnB_jLS8S7DA9LeJ
	fnYmyIheC0FViOHu4SDFl6uh3eDGl9p1P0mveZL0sQaJakNmZGJM.L5npVdrIjHhi.U8eFPWlVHW
	DcLT_YBVuLd.C8E8UPVoRzpfZDSPhapLOJfZwi7cbJJdcy_7GI7RVtllHDoRxBzKMlm7Ts3iQzpf
	365KuqnMhoI2nIAvANo4_XyKMmmjFnDq5OpadtQkgNs15HRNsQwaURecmzb7jpwvULsAMWfSy8Hs
	_UDD8E7MQRx.WFdJNbzXC9VRVyIxLwn4uiMnSAIuUmzICSJtPV.0F0qfk3KaJ39FW3bazmf26d4a
	OkqLSl91T2hBWvZfaZz2TtbBLpOx4am0lh0lKKUQirzxbSRTyMIo_PI.kiZqWyIzrvFXsqoHYtvn
	S5TW3ocYEKdo6N.sXHGjQBX0kphJ.sG6SPzZNtrG4UkE0cPk7GDqY.NYayS_6AAX5mgemxt4iD16
	kzNbkp5cN_4t7H.3nT5rgn6c.HMXJdbzosz0Ir9cD2zxEqaC0nEQib4OYnGUJJy5HcTHsAJZ.mzM
	b1zdFpNXbouMtYjh1D35PLAxCU5HDsBoYpuWsXocGc4NHB4vaVR56Hf3.ucDlnxSp8iqpUw_PUJ6
	9SpYP4.ZQNqaWfgxQZoy98RrYxAkoTKLIqd8EApdGbO2s3EaW349dllVxkBobuSsibTEGMMPAkZ.
	C_c_jxeTtnE8lRD2rU2LiAVsD85Eszl7x1a8ZmbpqtSLFWeHWrbhJG9K4yuZp9zWtIntQwxXh73C
	Ewk4pmOdAKuYUSI7IC3CK_.sY6yevsX8bOB5CYa4lcy3o9zRFgDXmlZHvBwBO02qu_UTyHjsj3wx
	8JbllBP5XQ4er3dwi_guf.ESs2O90LfMBaCtJFfbDAG9bEz8SrWlSiMUw0aCg8xsxbOuTMtVit_M
	0eQacUDAa4WrjpLORIPCxIsJNUfDrdFqw_eR47GbD7PFxLPNpDELT6WYWp8yZ0nztW4EvUY9KeLx
	9ayfFxm1DpH0qYu8GEmqLe6JoeZd1w2euWK64dirJOewaDR4Xn4iUeEpGIctIODeZtQ8On0CWJJs
	I_.VFns8pOY_1jH.lB3LP0ko.SJPUJYh8WqONVQ..9UdkWf5Xiwl2sGHUJ9DcjYQ5XWX39QbNLci
	CST.dN1lalnNah.zwOayoOxDdayPKAH6sunJqyeNdF2gRTxNavpFVpAZMk9CSJVJlV.GTCdPTtC0
	rNoGSfH6cWiLevsNs2hftwLcLYQ1ArjXWQrViKLeuZqp1H6Iw7Rtfs85R_DJIpOFOoLWEIHXtyyH
	yCldAzwVDsfT7SogxG3qcTzcpRwVLA2dCWrBYj.kQIm9FJzINU_PZQXh_brTU2AoM_ZnYagSt2BN
	hVSyF5gxPeOH6UAAEN9y_bwatjE5eTe8fwW0z7YUeFG9gjJddQdw7fI0DP6G4Wl6qXWO72lwqU5c
	8SX_k.3WZHtVu9FNRPmqNXdYZ4LsrMV90OPdUzlL3_MGz8k_vo_I391ORztMYSqSvfhEjJW4YDkr
	NsrJ6bzqTimgZc6YWoMK6dOmgJdP4D3laAPt0K5YiGMkyHyY6vxaTai.rGViNMi0dTSZ6y4EsI6w
	WGXnOPoNA.SMZrIZDuY2QbXs4T8q2YFK.zHQdCF6OS2nF75YNVKr45voBGh.flVdH
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 7 Nov 2020 00:52:01 +0000
Received: by smtp415.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID fa98ad07c73c00271eb5e3ba097795aa; 
	Sat, 07 Nov 2020 00:51:56 +0000 (UTC)
To: Paul Moore <paul@paul-moore.com>, Richard Guy Briggs <rgb@redhat.com>
References: <e4bf30e2-a92f-99b7-30d0-3e3473e30399.ref@schaufler-ca.com>
	<e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
	<20201102220834.GD55072@madcap2.tricolour.ca>
	<6c950188-a516-e9ed-caa5-42de40861596@schaufler-ca.com>
	<20201103011925.GF55072@madcap2.tricolour.ca>
	<CAHC9VhS9vyNj_ygkWFQssFb3FDoQ3C1dekiFEFXMgTCOL1bqLg@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [RFC PATCH] audit-testsuite: tests for subject and object
	correctness
Message-ID: <89a4f320-394e-c9b6-39d9-11f76b22f297@schaufler-ca.com>
Date: Fri, 6 Nov 2020 16:51:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS9vyNj_ygkWFQssFb3FDoQ3C1dekiFEFXMgTCOL1bqLg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0A70q7Di002422
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/2/2020 7:31 PM, Paul Moore wrote:
> On Mon, Nov 2, 2020 at 8:19 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> On 2020-11-02 14:51, Casey Schaufler wrote:
>>> On 11/2/2020 2:08 PM, Richard Guy Briggs wrote:
>>>> On 2020-11-02 13:54, Casey Schaufler wrote:
>>>>> Verify that there are subj= and obj= fields in a record
>>>>> if and only if they are expected. A system without a security
>>>>> module that provides these fields should not include them.
>>>>> A system with multiple security modules providing these fields
>>>>> (e.g. SELinux and AppArmor) should always provide "?" for the
>>>>> data and also include a AUDIT_MAC_TASK_CONTEXTS or
>>>>> AUDIT_MAC_OBJ_CONTEXTS record. The test uses the LSM list from
>>>>> /sys/kernel/security/lsm to determine which format is expected.
>>>>>
>>>>> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
>>>>> ---
>>>>>  tests/Makefile                   |   1 +
>>>>>  tests/multiple_contexts/Makefile |  12 +++
>>>>>  tests/multiple_contexts/test     | 166 +++++++++++++++++++++++++++++++
>>>>>  3 files changed, 179 insertions(+)
>>>>>  create mode 100644 tests/multiple_contexts/Makefile
>>>>>  create mode 100755 tests/multiple_contexts/test
>>>>>
>>>>> diff --git a/tests/Makefile b/tests/Makefile
>>>>> index a7f242a..f20f6b1 100644
>>>>> --- a/tests/Makefile
>>>>> +++ b/tests/Makefile
>>>>> @@ -18,6 +18,7 @@ TESTS := \
>>>>>    file_create \
>>>>>    file_delete \
>>>>>    file_rename \
>>>>> +  multiple_contexts \
>>>> "context" is a bit ambiguous.  Could this be named something to indicate
>>>> a security context rather than any other sort, such as audit or user
>>>> context?
>>> Would "subj_obj_fields" be better?
>> That is much more obvious to me.  Maybe even sec_context_multi, but I
>> like your suggestion better?
> How about just "multiple_lsms"?  It's relatively concise and better
> reflects what it is actually being tested IMHO.

I'm perfectly happy to call it whatever you'd prefer.
Anything substantive about the test itself?



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

