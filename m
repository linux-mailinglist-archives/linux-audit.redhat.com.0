Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2110D195B02
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 17:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585326262;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=bNfOfXBt9J08x1DYKy6B0CwmZlFRoK/lX4N9kOfe2xc=;
	b=EDE/Vp1h/ee6+OmdRj1QbzWNES6/wOYdYnR0+hSALvKnjdInfXOJGDjiQ9bvvH5qGC6n6F
	M4MIk+T4ZdBW7cZ44BUhyfr+Iq66xgDiKGD5uSHnh6fvYYIYSWDxbUxVVN0jwwWsRQ03O3
	IaYW+SpqhwH8Wd0L/I9vwLdoFjQ38vY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-igO4aQ8FM4Cxqj74iu6f5w-1; Fri, 27 Mar 2020 12:24:20 -0400
X-MC-Unique: igO4aQ8FM4Cxqj74iu6f5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EBC1005513;
	Fri, 27 Mar 2020 16:24:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 619405E011;
	Fri, 27 Mar 2020 16:24:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A34F38A055;
	Fri, 27 Mar 2020 16:24:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RGOADE012892 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 12:24:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50BE62037E56; Fri, 27 Mar 2020 16:24:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BC882037E4F
	for <linux-audit@redhat.com>; Fri, 27 Mar 2020 16:24:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 406928FF66F
	for <linux-audit@redhat.com>; Fri, 27 Mar 2020 16:24:08 +0000 (UTC)
Received: from sonic313-14.consmr.mail.ne1.yahoo.com
	(sonic313-14.consmr.mail.ne1.yahoo.com [66.163.185.37]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-48-l7gryNRsMJiOIrpQvUjQGA-1;
	Fri, 27 Mar 2020 12:24:03 -0400
X-MC-Unique: l7gryNRsMJiOIrpQvUjQGA-1
X-YMail-OSG: mmT88XIVM1k0LzAGuETGdeWcviBpBeIfe09h3YtNXmGqkWHX3NFi9muCO7hEh2l
	8cRxQIyVM.gJ0..pZ56tPo9gLAJzY9liN7GY63R.I0ckybBjOTe7neLPkvAvEQN.Tfzcg3VuO5Yd
	JVEpTRQRZ57RUzgMBsrdz8wh0WIOmeOXExfhmF2dT7XoW27dXKzmrUP2tbSKEf_wyHF6rHSuMmWb
	AQBEZJCSdM4HliEnCqrsdENxsDUyW2tbABaq3SEJgxk4iqjQZKHdBPyXGCVAl77HFEoOa8d3jlq.
	7xiYDc8hX9NlG0lNiNMSIwPaZUQW4ADAgs5zCehuMFJops.sPWgIWaXtoIyWn2ErEt0odhW1q87.
	R0ZogK4RUEiv7ewDDkan26e7MPfFRliNd7mp4pwyQEN7LMw2s8.RcNYPFMRzWqNtiWF_XhgoRy.H
	dukWhukMFqfASyoc03m9jlKzbuX8pzPLSpBkA.pr4A4NUD7EBt.yU1rzgWa_XXRDlPWBEuaSS9ai
	hOFl.X2QPbDIrz.uFj00pMyXNRLea13m.c5GOSvaNwf_FICKUKBeyQ9LVWFEdlNyQN90haZFf42Q
	xrF6NJ5verZZFbU5dVfTybrjp5HUxcrpHmEp1hzYb._HTpm4lmzoAEDO3uVsdXYcy9VVV8plswrd
	ujZf9sfKIMUvONgM_UhDSYP81FRpSaVgxGgertx98EqTh4iGrzT2fd_lTI1uW.9hxma4W9xPVS.O
	iufhFXYG8JEEYfGm0XvK__YdBdvgb2XwOnuuZPfztqakH1bImVifJAeJX3pA3TCqbu0Z_.jCkr6.
	NvrGRo701jEJsf.TIEpEv5zD4.PrBUDOoexoSNM7rA5Uz8XaF3uCc64e98cotHMiyoVHjX2gHDtv
	F3wQzDPpJrdW8T7Z8pVxFmgIm1XguWPWccoJKLbhr0vVt.ahTUHdtwHpHPWg.i2c9rke1OvKkl7c
	26W9pPuWEwMD71nLRBXCO17ClhAo1iOAgZnYmoL3qlTBUy8u6ZMA9Tql4c7Gkl2gRXXGkEcQrw8Y
	rlHyqmHPrLcivwUWYM0jfzyHQpZ7GnSa2GSutLUpgf_zqJLdPU1vc5N7Nc3Xb0eqFAyfth4xCZYH
	pX82Qvjh2tDOXoOVxfeVL8zFInArxBGZj6Jd94mmNbPOO6LHseQr2pwUVlTnwklFDGzy1_yYeYFs
	PHxTxbcdgMpECRbXdW89FnAvSudYwytqFTbg5VGPoiazdF6.d0q9OFpLzvCgn9P9nvg0BK5i6y_i
	Enyl2k3ObaOwqiarKWoPwatwKnSt3.KZL.2J.1CwijrQFxWQRuaUzdigFW3KqMbTQ4tsmBV4bVEl
	wRN0m0bq9ks.wOn701TTX2btuC93m6BGLRHwPNGnQeVcwjdjsqLuBkUjp.KEfWOBoKmpWjCiO500
	WKHZgrQtCfYHP_aQaNp_gJpXwZ0B8GQkNxWnE0WBAUzOqaiAPtro-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic313.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 27 Mar 2020 16:24:01 +0000
Received: by smtp424.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 7e636f0261e94670ac78422b17bef46a; 
	Fri, 27 Mar 2020 16:23:58 +0000 (UTC)
Subject: Re: Audit record ordering requirements
To: Steve Grubb <sgrubb@redhat.com>, Paul Moore <paul@paul-moore.com>
References: <de87d7bb-a7df-0251-0f33-9aeeef3d0879.ref@schaufler-ca.com>
	<de87d7bb-a7df-0251-0f33-9aeeef3d0879@schaufler-ca.com>
	<CAHC9VhS3Nj=KHAaCV2s9h3G02RG96BzmhiqrGT5n+Y+Cegy_QQ@mail.gmail.com>
	<2966967.03MRl4nvq3@x2>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <560df83d-e905-ebb7-9744-5d3427541fcd@schaufler-ca.com>
Date: Fri, 27 Mar 2020 09:23:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2966967.03MRl4nvq3@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RGOADE012892
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/27/2020 7:03 AM, Steve Grubb wrote:
> On Thursday, March 26, 2020 8:28:51 PM EDT Paul Moore wrote:
>> On Thu, Mar 26, 2020 at 7:49 PM Casey Schaufler <casey@schaufler-ca.com> 
> wrote:
>>> I'm looking at adding an audit record type for the case where
>>> there are multiple security modules providing subject data. There
>>> are several reasons to create a new record rather than adding the
>>> additional information to existing records, including possible
>>> size overflows and format compatibility.
>>>
>>> While working with the code I have found that it is much easier
>>> if the new record (I'm calling it MAC_TASK_CONTEXTS) can be generated
>>> before the "base" record, which could be a SYSCALL record, than
>>> after it. Can I get away with this? I haven't seen any documentation
>>> that says the CWD record has to follow the event's SYSCALL record,
>>> but I wouldn't be at all surprised if it's implicitly assumed.
>> From a kernel perspective, as long as the timestamp matches (so it's
>> considered part of the same "event") I've got no problem with that.
>> However, Steve's audit userspace has a lot of assumptions about how
>> things are done so it's probably best that he comments on this so his
>> tools don't blow up.
> There are some assumptions about what record is last in order to speed up 
> "aging" the event during search so that we know the event is complete and 
> ready for processing. We can always change that if needed. But a new kernel 
> won't be compatible with older tools.
>
> The only long term fix for this would be to have something that says how many 
> records are in this event, then add a field for each record saying which one 
> it is. Then we can have a reliable way to decide when we have all records 
> ready for processing. This only affects searching/reporting, not logging.
>
> But I think the records are in chronological order as the syscall traverses 
> the various observers in the kernel. And as Paul said, as long as they all 
> have the same timestamp/serial number, userspace will collect them all up.

Most excellent. Considerable complexity averted.

>
> -Steve
>
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

