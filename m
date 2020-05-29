Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2A58B1E8B04
	for <lists+linux-audit@lfdr.de>; Sat, 30 May 2020 00:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590790231;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=JHR6zVURcxE9zo6phl3q5yfbaOUbcTdrjvQLwQFQWRQ=;
	b=hLOX3HcMGyXT2SuEvEy7MGoI8RAytsqTGXnCjtU8DGRM+JsLArhaU5upXxnVBgL3VI7ww0
	/x4EgbkvtgCfkRpV6yX0mD9T4AtnWlhKi+J9G8s11EaLSKl0g4K+OT8TWkXfPjmpsNQGlT
	Vxq5CKaVj8ck436lBdTgGb2xRvmHNm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-JmrpqZJXM4mKrgHVeqmzWg-1; Fri, 29 May 2020 18:10:28 -0400
X-MC-Unique: JmrpqZJXM4mKrgHVeqmzWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8B9E107ACCD;
	Fri, 29 May 2020 22:10:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DED319733;
	Fri, 29 May 2020 22:10:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97F406B5BF;
	Fri, 29 May 2020 22:10:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TMACY3024726 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 18:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 907C520267F2; Fri, 29 May 2020 22:10:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CBD32026971
	for <linux-audit@redhat.com>; Fri, 29 May 2020 22:10:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AA94101A525
	for <linux-audit@redhat.com>; Fri, 29 May 2020 22:10:10 +0000 (UTC)
Received: from sonic307-16.consmr.mail.ne1.yahoo.com
	(sonic307-16.consmr.mail.ne1.yahoo.com [66.163.190.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-362-XSdtzx4mPgu7sW1qz79e2g-1;
	Fri, 29 May 2020 18:10:08 -0400
X-MC-Unique: XSdtzx4mPgu7sW1qz79e2g-1
X-YMail-OSG: OZ5jKQoVM1lIhjABZ4CqPWErzdacGBK3SMUeL5bNMnGp3Dbr3ydEUDDi339KfE0
	UDzkAH62aRGPy_.zGjF.bs2stl_mQd5QtuFz5chFvydbO7jwYyd92XVXK3v2_ndpm_q5SPA88bZe
	ZVucywu8ax2PKF_TC5gUbMGj0WTIHRe6cyjDPIUBNmWQqzB4eplFRINn8aEAV5lhneyasQSVNp7a
	bXp5uBOp4uOM2bzFpncejtY8NPFs7OtRUQWDvXF4hke9TT9JEcxJjjpXpyPCX2.0EWux0.3nWXHz
	L_t0aOUv24p5N1QrI_Q9uxvpz9QKlljZhxq2DUASRDW6EiUNk8SZ4Mr8JggTZtGPHM8tKY5.uNN4
	IqosSRAn_41leAhk7RzAObwD3Hf93vg2xbXiAPpFNHCjWg2i1I1VL8ujBfvNfh3.ENnN6R9vufMM
	ZqhJNrkH8iK9supHag32KJnkpP2XonXW9G7Q57OVmtszaeS0jX7qCXhEjCZQm9cgssIy7RKTB0AL
	MX0eVu2o_aqzNHUvqT2cwtt.RkcG60bTu29p9.eCAZ1ioIGZcq1CNVr6ImctnUEHPhGzyB4mrKYd
	qDpEn0Zy2PzaAo1fan6TtK6.WH7bNj8Q6yJRGJc5dH4ntylCY95Ww0NIxkz34QrBj6DZHEqQ9H21
	iXkeU.O1znozAARAp6r.F38I6d5fnk22Rr6OiBrqo7vq_cohB81qpGE4P0l__ckoVrmrDVLMuJqf
	ciNkxE7RN_MNtFJuKlnCyKSTiVROwc4jmqB.VuRlmJkMrLLhr0qglDsgFif0i6k7J1gQSlbS2Q.r
	5BstMcYtXOH4mp5pPPzU54YnGTTFIxemXi4Gma9BvE78pig47DlEp.YAnlkYG6yxRF1NV2sPvncY
	CCpF6afNYgOIX.BctI_doEO1ZGdG1mzi5TSgkNLEvL9nWJSc5PVoxP4zrJo535Co9K8_w_c7NFD0
	JFlv_F3EhSNMX9qcKoqZxlAxuGDuBOPvipG1iYPmz6yKUbXp4_Hriap8HGfqQeZpr_M0uyza7Fud
	htoSl41FYvE8W5lJzSnbnCbdBfCwuYUa.b0cLdUa500_0ig5reerB1TfNpln7G22d.SIcAh0c572
	JEWjdDrIVqoy6Cq.ZZerlksEZRBO8KMfqQmPLowpQ69Rc8Z3u8sBYlSEiQNB9Cg9H6YYmH33ywPJ
	XYuSmIS.4BGEILuXXS2uUvSzuqp2HuVfWFCLoQNisCLhRM9KODwhVJC8.Kubcj40KA8FCXxN2_X1
	T9nFieWx.g_b_lzmQVhidDt3ybE7CdTrkoe4CRQrfU3it_OpcAHF4W3qe_B9gnwn7JGGntzfES5A
	OR8T_81qSF.DQIt0ZjCNA5D0S8sh0sFDJ6rQQ2QaIAaTJ5fCeLww4AQrA2h29hXH477QHlsn_gV7
	Hkx4urj46Pfv1yqZZyg4c8HzUGsXhM.uSKLypN1ccRWq2
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 29 May 2020 22:10:07 +0000
Received: by smtp427.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID f13ed4b4dc37306e22d68829077cc70d; 
	Fri, 29 May 2020 22:10:04 +0000 (UTC)
Subject: Re: The audit "context" and when to expect it.
To: Paul Moore <paul@paul-moore.com>
References: <45ce3357-ca82-8721-22d6-dabe751ad8fa.ref@schaufler-ca.com>
	<45ce3357-ca82-8721-22d6-dabe751ad8fa@schaufler-ca.com>
	<CAHC9VhQL9Q=b75o3Y6o4VvQb97tgkhqbJ4z3zQUBm6wsWvUF9A@mail.gmail.com>
	<29258822-14bb-5ef9-eec9-e5d09f22d70f@schaufler-ca.com>
	<CAHC9VhTF-Y+YW50Qo-UgOFPuvGPvHxPph-KHfU7CmsRbD7QW1A@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
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
Message-ID: <8273d350-9d5b-aa0f-1929-adba3a043802@schaufler-ca.com>
Date: Fri, 29 May 2020 15:10:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTF-Y+YW50Qo-UgOFPuvGPvHxPph-KHfU7CmsRbD7QW1A@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/29/2020 2:49 PM, Paul Moore wrote:
> On Fri, May 29, 2020 at 5:42 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 5/29/2020 12:01 PM, Paul Moore wrote:
>>> On Fri, May 29, 2020 at 1:59 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>> What does a NULL audit context (e.g. ab->cxt == NULL) tell
>>>> me about the status of the audit buffer? It seems like it should
>>>> be telling me that the audit buffer is being created for some
>>>> purpose unrelated to the current task. And yet there are places
>>>> where information is pulled from the current task even when
>>>> the cxt is NULL.
>>> The simple answer is that a NULL audit_context indicates a standalone
>>> record, meaning a record with a unique timestamp so that it is not
>>> associated with any other records into an event.  If the audit_context
>>> it not NULL then the information in the context is used to group, or
>>> associate, all of the records sharing that context into a single
>>> event.
>> OK, so if I want a add a sub-record with the multiple secctx values
> Terminology nit-pick: there are "records" and "events", there is
> nothing we would call a sub-record.

Thanks. I stand corrected.

>   In the case you are referring to,
> this is a record which would always be part of a larger collection of
> records.  It's similar to a PATH record in that it doesn't make sense
> by itself, but when combined with the other records in an event, it
> provides useful information.
>
>> for the events that include a subject value I need to change those
>> events to use an audit_context. Is that going to introduce an
>> unacceptable memory or performance burden?
> No more so than any additional record.  Or rather, it seems like this
> is the only way to do what you want to do so I don't see a way around
> it.

That's what I'll do then. Thanks again.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

