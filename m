Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 83B341B6094
	for <lists+linux-audit@lfdr.de>; Thu, 23 Apr 2020 18:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587658790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=+BBGrVt9lof+BsCUv/2teQpB+S3LhFuH/PSm9qgqE9o=;
	b=D0OaRn50NrxAIm5flMgsg8slmhyzuZJHoIqVeFDpZShnOQbTLJ8ILCG1+HrIasm5kKklHT
	TMZDYgV7fmGAvTPqBodlSjOtsh5ZhK3YkAW2au3sFdfyqnUxPgZVImpsCf3K9SuMmpl7bF
	JfVCEsTKK3QVe2jDxM+qGPsuAHayOLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-xCBFNxW-Oc20Q_e9EhOhpA-1; Thu, 23 Apr 2020 12:19:44 -0400
X-MC-Unique: xCBFNxW-Oc20Q_e9EhOhpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46DE9835B41;
	Thu, 23 Apr 2020 16:19:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE1E5D9DA;
	Thu, 23 Apr 2020 16:19:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 820C34CAA0;
	Thu, 23 Apr 2020 16:19:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NGJMhk015973 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 12:19:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3413D2166BA0; Thu, 23 Apr 2020 16:19:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F9EC2157F24
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 16:19:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 440D1833B53
	for <linux-audit@redhat.com>; Thu, 23 Apr 2020 16:19:20 +0000 (UTC)
Received: from sonic301-38.consmr.mail.ne1.yahoo.com
	(sonic301-38.consmr.mail.ne1.yahoo.com [66.163.184.207]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-82-9LzvWYQUNyaVM96LBPuFxA-1;
	Thu, 23 Apr 2020 12:19:16 -0400
X-MC-Unique: 9LzvWYQUNyaVM96LBPuFxA-1
X-YMail-OSG: LL5pFoIVM1kelo6LE2buIpeQdQD8CE2xpY3HND6KWD2T0ovd_ZFniI2hgJqa07m
	HfxzaVbkv_HRxTiz9lqXIJvwkp_3f5noogW0xaDv5fmesI5kLlwPAH01cSsYcXaWJu8tegmNvCgc
	MWPMYCl4j3gjQsLhSzqnsMv9FDb7_TIYlXuU2Lwhqz2cXCPVjzzIB3OAzS2MV4pd9BVPcF0RheO0
	CDb8WDHszQhw0N_4krBAw7VIcKVmFpOKPIa9BPvGEWGZPZwFHkXmtbATQbOyJRbAIfQrT1jNahPW
	aAZDvLAu5PLYdKQy1rI4llsRgQuIvMGq4yw.Cslu9.rXqzAQ8BBhrLcukkeHVU0G.HBis_1mQ8cK
	Fv9.sMEMFswVOhyzekQjLfR4U6tBYgGWuiWHMiJAEBDbwPupRJkHLUVMgV4CkC0tP.BajRCB9OBS
	qJiyMJ2RQKN3664yUp2R5o67B_7ivTWkMA8Pqi5rG3tBHziwcIehLRO33fEkC7PLD6ecCJ59VaBh
	1DbBHVhdzYE.bZD_QUgESUl7brtifR_ZfN4fbJ6YRmf2MZJ0GbdlbMmz8GopAjmVX_Tq00y_oVQw
	_jXcREXIGiVrGzWgl7DWnSGgsPiKoj3RU.hW.di7NAZjjsw0pgT09iYRKCU4qnJUu7xzdjw6MrgN
	Y7UPgHbP96wsbcK2gX0rseyoxyfk6nOVcNcT9DGkdlr.dL1a2RgZBGSU9zK8gvog3f1ZwteHQswT
	sIBWb6HiaLK4WydWpLhIU9x0yy.QGFCwlQd61c0Da662UmgdQrknyzzLev2IgMdf.OOV6oTTR_jY
	ardlmFVnkEGo0vbEZgXGtQHC1tvN08lNVMOqIrXV3jcd7lkWsuQLcaDNteHnKi8VdQFtf4EByrmz
	j.obKuxrkS1V0KHFi70y1K2trdHuBPE0Tqx6xp.TplKMfjj1R2D9jySkw21n0JaEKBPAwiZKCIu7
	UGM3lsh5LtlAMKrTa_3fhb_6osWsKi050yBYDcYCv6qhkqI_gRpAN5NGc3QwggVWjlrQ9dW9tx4X
	QtywXROw8eMZUvlgHZOBvCdFdoMwc5RmRvZAYU8XsoPEKlQvUOlg5KuOR_X238Pf8SkO3_2dV8OO
	Yj1ngmgYxZbSLLct0gq2scKFNDBxf6oUb_TFbDNssmIoWRx9r3m3XmPuONwWHQxuMiDr7MKnFE4x
	3Ss6slQ409iYoWzNeKXpL7cxoYa8QGUhk.zPpEWiwj6q0UsDyEjIi0bGlQ8a7vd_x75kZup2Da8b
	F3clpW2twEUJv26DxZ4EeIaFPqeqX1MHJiSqxVeO3iHs5rL_exdp4i6RkSKaGTP9Lkupcl4eFupq
	.yDhhqQQzxn7YFsLmSjowIiaDf4DenOwZuY0NGBN9deUtTMA4KTyzW4m9jVtnWYUx5dd.9HfGDUS
	FLmzkZvnV0.cO
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic301.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 23 Apr 2020 16:19:15 +0000
Received: by smtp416.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 398a661a96cb8e503d095e8534eb3bb0; 
	Thu, 23 Apr 2020 16:19:10 +0000 (UTC)
Subject: Re: multicast listeners and audit events to kmsg
To: Lennart Poettering <lennart@poettering.net>,
	Paul Moore <paul@paul-moore.com>
References: <20200414092740.2fdf0f78@xantho>
	<20200415155355.qudqepcvvler55xs@madcap2.tricolour.ca>
	<20200416120612.GA52165@gardel-login>
	<CAHC9VhTxW5S9Nv8Z_3eTNDHiu9SmDsHvBG_7abH+Db1the19UQ@mail.gmail.com>
	<20200423073021.GA62700@gardel-login>
	<CAHC9VhSu=cbr_f3fyX_wdBdt_+xHwBBjOJojrk-iNgwhhBCg7w@mail.gmail.com>
	<20200423135743.GB63067@gardel-login>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <f88f306c-9274-e2a6-fbc8-9e750e1289ef@schaufler-ca.com>
Date: Thu, 23 Apr 2020 09:19:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423135743.GB63067@gardel-login>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NGJMhk015973
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
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

On 4/23/2020 6:57 AM, Lennart Poettering wrote:
> On Do, 23.04.20 09:50, Paul Moore (paul@paul-moore.com) wrote:
>
>>>> If systemd enables the audit stream, and doesn't want the stream to
>>>> flood kmsg, it needs to make sure that the stream is directed to a
>>>> suitable sink, be it auditd or some other daemon.
>>> This sounds as if journald should start using the unicast stream. This
>>> basically means auditd is out of the game, and cannot be added in
>>> anymore, because the unicast stream is then owned by journald. It
>>> wouldn't be sufficient to just install the audit package to get
>>> classic audit working anymore. You'd have to reconfigure everything.
>>>
>>> I mean, we try to be non-intrusive, not step into your territory too
>>> much, not replace auditd, not kick auditd out of the game. But you are
>>> basically telling us to do just that?
>> My recommendation is that if you are going to enable audit you should
>> also ensure that auditd is running; that is what I'm telling you.
> Well, that's the "audit is my private kingdom" response, right?

I think it's more the "hey, watch out, here be dragons" response.

> People are interested in collecting the audit stream without having
> the full audit daemon installed. There's useful data in the audit
> stream, already generated during really early boot, long before auditd
> runs, i.e. in the initrd. And for smaller systems auditd is not really
> something people want around.

Audit systems are tricky because they have to be high data rate,
reliable and low impact. A user space component that doesn't meet
all of these requirements 100% of the time will fail. If auditd
could be made faster, more reliable or have lower impact and still
meet the other criteria you can bet it would be.

> For example, Fedora CoreOS wants to enable selinux, thus is interested
> in audit messages, but have no intention to install auditd, in the
> typical, minimal images they generate. See:
>
> https://github.com/systemd/systemd/issues/15324

If you can do a better job of consuming audit data than auditd I for one
would be impressed. I've written multiple audit systems over the years
(not this one, but the issues are all familiar and the solutions similar)
and the kernel -> user interface is much, much harder than it looks.


>
> Lennart
>
> --
> Lennart Poettering, Berlin
>
>
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

