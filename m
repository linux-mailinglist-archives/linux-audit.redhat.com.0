Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A3ED7177D4C
	for <lists+linux-audit@lfdr.de>; Tue,  3 Mar 2020 18:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583256197;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=e0Mr5G/GQy/VthSuVMRINlIlTPdhtyWPKUEJh5+OVS0=;
	b=CVeojj2XccISZgbcE2Kvkp3gs8MlsGJ1iiuiWZpg3xO5OeBVbAMpnIAe3/aI1rM/Tv9vaj
	uoynlPbPKWn8K+DFdbHtGuUDP1BxIyp/YQCb3EkrDcDDgDYMQcrIj9DsbXmfBMYDDsWkLi
	APQGatKC7e7MrPMHC949+ZoIdMB+g/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-xKXH8DOFOEa651RAGK8sow-1; Tue, 03 Mar 2020 12:23:14 -0500
X-MC-Unique: xKXH8DOFOEa651RAGK8sow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 144DA800053;
	Tue,  3 Mar 2020 17:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55FCC5DDA9;
	Tue,  3 Mar 2020 17:23:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7652D1802224;
	Tue,  3 Mar 2020 17:22:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 023HMlR5007180 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Mar 2020 12:22:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3ACD1C678; Tue,  3 Mar 2020 17:22:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EED7B3511
	for <linux-audit@redhat.com>; Tue,  3 Mar 2020 17:22:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AE888002E0
	for <linux-audit@redhat.com>; Tue,  3 Mar 2020 17:22:42 +0000 (UTC)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com
	(sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-248-R0S5W_VXMKmWeI3UpPN9nw-1;
	Tue, 03 Mar 2020 12:22:40 -0500
X-MC-Unique: R0S5W_VXMKmWeI3UpPN9nw-1
X-YMail-OSG: c6Rbk7wVM1lOIQVsseO0KFoWn4.KgaxcjpqC3sL_hGGoZGwpRo80E2Jbnx6Wn41
	b4ydqakzUhW5YDTWkyXcHXfNlqX5T4HJ3_kNu78J.KdFj18ovxxsbtXH88k6ViZ7xILZjohI5Gj0
	awYRUkYWjgiUn69R7zRIJHRaeWLgVV85B_2QF5aW8JGAYLdbhxrso81WQiX9rEtO1AVziMLKn2.R
	gStyQ4_jmk9ALuiziC8C7kTdq5Oru5Hn47G.Ew4tXCdHCi3Ry0S3BHW5M9WqXrMGcfXJd16rHUdQ
	MiSkHpEAKMwPWVSQoyTlzbnjOv3Vx7d6xVTwhKTNwoL7es.1mglkPYGm0UMk24gJIiOb7Kazmc02
	OXtvbjQLhjfuopcHhybJYniBR6LwRqNKcvAuYuGFw4LAtZuuednMoZdlK02B7HenQNCUrh9Y8Ifo
	o8Z.xPR.R5s9A8bjAnDnsdsueVSy9wZFHJ9cyRu7CYZjWNsHbl.NvJpC9QU7_Zwm95WexRcfCsnS
	Y_uo0nuOpikp4IyrhodXkWZR..bnJAz4Df4aUwMBpvqvhyeoBJEvwIUJ19MN37RLG9e8E10U5P_t
	Px3gMdtvT237obY6rfTcDP1A2hC1LaXhTe99avoVC7mKdVMyBTCqHKMOBbu3d6mlQ35W8kfiPs78
	gWF.Jhe9GPbL4CTZ3BGRYNogmgUWFT3UYtsAuM50auW5h92sNlxwx04ymxvk0Uusw369bZNf9rRb
	mcz1qIvrZ4v02wJpNGbQPZ.L1JruWRvo3S67Urb_5TvKV81T0FornbNbbxTXRr1EC5uS0T3hYxI3
	L3lFZMCTBpGGlKutS.vQcXcRSV1Ed5waI0al.vB6bcLpEe_KqK7bgrJHrT0AoMxjkWP0swxhfQLl
	pmmQjew5JL8biBczM20euWDCQxUy1tPKX5BYG.6oLiRJDOqxwUyMBV4G2JVfrjDP5k5Gd3PSI8YF
	jCoODyaUazTcbKXZPscuzWde317VWhQziprOgUSc3S2mvDBynnq1bLL0nsiLFh4BcCesFyPPu2Uz
	MJQpBDOzn8GZ9GztzgE8Up6cvSVtfbBYd0JQaHECZTl6pnPqiLBrXBLP_0ltTwFdLsVNBFTU6THS
	aICkbwOVzfbhnXErxw26Se8SroTQyhSS.ewRztcNcjek6UHPd1hnMu4z7ga061jsXvFsJwWsC9N7
	UEhVTBJqz8fEn3Gvjus7EWJoNhFQqBQIB5JsKNGQQBPqi79coSNvX4vJjF_oREYYLapFewZEDx_p
	uJ7k0IQID0hnYUgKkQy_b6tky.oJrFxi33XuY_PIJwSWwuayU1hydgx.VeGhXz8PiAZPuSHjXIT0
	hXltK3tUDXJn4zL3B7RK_hRaINhdpr1rrc6srrgdOI76HDFKhfC5C0TutGk5wF114Rzf9UDyIVWT
	aW8HAFc.VSb.JI7V9DX4-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 3 Mar 2020 17:22:39 +0000
Received: by smtp426.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 47ebcbd994a9d7e2bb589f9d69a4fe4a; 
	Tue, 03 Mar 2020 17:22:34 +0000 (UTC)
Subject: Re: [PATCH v15 00/23] LSM: Module stacking for AppArmor
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
References: <20200222000407.110158-1-casey.ref@schaufler-ca.com>
	<20200222000407.110158-1-casey@schaufler-ca.com>
	<853ac380-2132-febe-fda0-ff0a0a74d480@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	mQINBFzV9HABEAC/mmv3jeJyF7lR7QhILYg1+PeBLIMZv7KCzBSc/4ZZipoWdmr77Lel/RxQ
	1PrNx0UaM5r6Hj9lJmJ9eg4s/TUBSP67mTx+tsZ1RhG78/WFf9aBe8MSXxY5cu7IUwo0J/CG
	vdSqACKyYPV5eoTJmnMxalu8/oVUHyPnKF3eMGgE0mKOFBUMsb2pLS/enE4QyxhcZ26jeeS6
	3BaqDl1aTXGowM5BHyn7s9LEU38x/y2ffdqBjd3au2YOlvZ+XUkzoclSVfSR29bomZVVyhMB
	h1jTmX4Ac9QjpwsxihT8KNGvOM5CeCjQyWcW/g8LfWTzOVF9lzbx6IfEZDDoDem4+ZiPsAXC
	SWKBKil3npdbgb8MARPes2DpuhVm8yfkJEQQmuLYv8GPiJbwHQVLZGQAPBZSAc7IidD2zbf9
	XAw1/SJGe1poxOMfuSBsfKxv9ba2i8hUR+PH7gWwkMQaQ97B1yXYxVEkpG8Y4MfE5Vd3bjJU
	kvQ/tOBUCw5zwyIRC9+7zr1zYi/3hk+OG8OryZ5kpILBNCo+aePeAJ44znrySarUqS69tuXd
	a3lMPHUJJpUpIwSKQ5UuYYkWlWwENEWSefpakFAIwY4YIBkzoJ/t+XJHE1HTaJnRk6SWpeDf
	CreF3+LouP4njyeLEjVIMzaEpwROsw++BX5i5vTXJB+4UApTAQARAQABtChDYXNleSBTY2hh
	dWZsZXIgPGNhc2V5QHNjaGF1Zmxlci1jYS5jb20+iQJUBBMBCAA+FiEEC+9tH1YyUwIQzUIe
	OKUVfIxDyBEFAlzV9HACGwMFCRLMAwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQOKUV
	fIxDyBG6ag/6AiRl8yof47YOEVHlrmewbpnlBTaYNfJ5cZflNRKRX6t4bp1B2YV1whlDTpiL
	vNOwFkh+ZE0eI5M4x8Gw2Oiok+4Q5liA9PHTozQYF+Ia+qdL5EehfbLGoEBqklpGvG3h8JsO
	7SvONJuFDgvab/U/UriDYycJwzwKZuhVtK9EMpnTtUDyP3DY+Q8h7MWsniNBLVXnh4yBIEJg
	SSgDn3COpZoFTPGKE+rIzioo/GJe8CTa2g+ZggJiY/myWTS3quG0FMvwvNYvZ4I2g6uxSl7n
	bZVqAZgqwoTAv1HSXIAn9muwZUJL03qo25PFi2gQmX15BgJKQcV5RL0GHFHRThDS3IyadOgK
	P2j78P8SddTN73EmsG5OoyzwZAxXfck9A512BfVESqapHurRu2qvMoUkQaW/2yCeRQwGTsFj
	/rr0lnOBkyC6wCmPSKXe3dT2mnD5KnCkjn7KxLqexKt4itGjJz4/ynD/qh+gL7IPbifrQtVH
	JI7cr0fI6Tl8V6efurk5RjtELsAlSR6fKV7hClfeDEgLpigHXGyVOsynXLr59uE+g/+InVic
	jKueTq7LzFd0BiduXGO5HbGyRKw4MG5DNQvC//85EWmFUnDlD3WHz7Hicg95D+2IjD2ZVXJy
	x3LTfKWdC8bU8am1fi+d6tVEFAe/KbUfe+stXkgmfB7pxqW5Ag0EXNX0cAEQAPIEYtPebJzT
	wHpKLu1/j4jQcke06Kmu5RNuj1pEje7kX5IKzQSs+CPH0NbSNGvrA4dNGcuDUTNHgb5Be9hF
	zVqRCEvF2j7BFbrGe9jqMBWHuWheQM8RRoa2UMwQ704mRvKr4sNPh01nKT52ASbWpBPYG3/t
	WbYaqfgtRmCxBnqdOx5mBJIBh9Q38i63DjQgdNcsTx2qS7HFuFyNef5LCf3jogcbmZGxG/b7
	yF4OwmGsVc8ufvlKo5A9Wm+tnRjLr/9Mn9vl5Xa/tQDoPxz26+aWz7j1in7UFzAarcvqzsdM
	Em6S7uT+qy5jcqyuipuenDKYF/yNOVSNnsiFyQTFqCPCpFihOnuaWqfmdeUOQHCSo8fD4aRF
	emsuxqcsq0Jp2ODq73DOTsdFxX2ESXYoFt3Oy7QmIxeEgiHBzdKU2bruIB5OVaZ4zWF+jusM
	Uh+jh+44w9DZkDNjxRAA5CxPlmBIn1OOYt1tsphrHg1cH1fDLK/pDjsJZkiH8EIjhckOtGSb
	aoUUMMJ85nVhN1EbU/A3DkWCVFEA//Vu1+BckbSbJKE7Hl6WdW19BXOZ7v3jo1q6lWwcFYth
	esJfk3ZPPJXuBokrFH8kqnEQ9W2QgrjDX3et2WwZFLOoOCItWxT0/1QO4ikcef/E7HXQf/ij
	Dxf9HG2o5hOlMIAkJq/uLNMvABEBAAGJAjwEGAEIACYWIQQL720fVjJTAhDNQh44pRV8jEPI
	EQUCXNX0cAIbDAUJEswDAAAKCRA4pRV8jEPIEWkzEACKFUnpp+wIVHpckMfBqN8BE5dUbWJc
	GyQ7wXWajLtlPdw1nNw0Wrv+ob2RCT7qQlUo6GRLcvj9Fn5tR4hBvR6D3m8aR0AGHbcC62cq
	I7LjaSDP5j/em4oVL2SMgNTrXgE2w33JMGjAx9oBzkxmKUqprhJomPwmfDHMJ0t7y39Da724
	oLPTkQDpJL1kuraM9TC5NyLe1+MyIxqM/8NujoJbWeQUgGjn9uxQAil7o/xSCjrWCP3kZDID
	vd5ZaHpdl8e1mTExQoKr4EWgaMjmD/a3hZ/j3KfTVNpM2cLfD/QwTMaC2fkK8ExMsz+rUl1H
	icmcmpptCwOSgwSpPY1Zfio6HvEJp7gmDwMgozMfwQuT9oxyFTxn1X3rn1IoYQF3P8gsziY5
	qtTxy2RrgqQFm/hr8gM78RhP54UPltIE96VywviFzDZehMvuwzW//fxysIoK97Y/KBZZOQs+
	/T+Bw80Pwk/dqQ8UmIt2ffHEgwCTbkSm711BejapWCfklxkMZDp16mkxSt2qZovboVjXnfuq
	wQ1QL4o4t1hviM7LyoflsCLnQFJh6RSBhBpKQinMJl/z0A6NYDkQi6vEGMDBWX/M2vk9Jvwa
	v0cEBfY3Z5oFgkh7BUORsu1V+Hn0fR/Lqq/Pyq+nTR26WzGDkolLsDr3IH0TiAVH5ZuPxyz6
	abzjfg==
Message-ID: <658202b8-c257-e74f-1769-af40cb2325ab@schaufler-ca.com>
Date: Tue, 3 Mar 2020 09:22:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <853ac380-2132-febe-fda0-ff0a0a74d480@schaufler-ca.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 023HMlR5007180
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, James Morris <jmorris@namei.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/27/2020 9:29 AM, Casey Schaufler wrote:
> On 2/21/2020 4:03 PM, Casey Schaufler wrote:
>> Resending the audit related patches to the audit list,
>> as there have been problems with the CC lists.
> There's an awful lot of interaction between the module stacking
> and the audit sub-system. I have not gotten much feedback about
> the audit changes recently, but I can't bring myself to think
> this means there aren't any concerns. Before I start pushing for
> the stacking to get pulled I would really appreciate either ACKs
> or meaningful comments from the audit community. I can see that
> there's a lot going on in the audit sub-system, and appreciate
> that priorities may be elsewhere.
>
> Thank you.

I have to start pushing on this series. If the audit community
hasn't any additional feedback, I'll take it that what's here is
acceptable and move my lobbying efforts elsewhere.




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

