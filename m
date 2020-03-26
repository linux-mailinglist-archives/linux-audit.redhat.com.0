Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5D059194D7E
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 00:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585266615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post:autocrypt:autocrypt;
	bh=gBeneMflrIo1wefQlZGvNPMTLhV4qrmIe+eRW0Bwqog=;
	b=Nwe5D5lh9hoSLTWHE91LBX8uuZk3qoDCMD7CElCJgiZSTmuAtKeqT6fQT3NLuR7HxR6gfj
	CrtqpHB6P1IuorgZOUesAkGENW9iEvYWMGTqZbbame/Lo9Xjk2Ajw6ZoZDX5XITUYbRsDT
	4aNR+DVulJ5o63Fss3A+uAAoYwXfjlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-kBlIArLaPQ-kdbQzcnOglQ-1; Thu, 26 Mar 2020 19:50:13 -0400
X-MC-Unique: kBlIArLaPQ-kdbQzcnOglQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B971B18BC7;
	Thu, 26 Mar 2020 23:50:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 573741001B2D;
	Thu, 26 Mar 2020 23:50:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 937EF18089CD;
	Thu, 26 Mar 2020 23:49:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QNnhQC014972 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 19:49:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 449EE1055307; Thu, 26 Mar 2020 23:49:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40E701055301
	for <linux-audit@redhat.com>; Thu, 26 Mar 2020 23:49:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3158D101A55D
	for <linux-audit@redhat.com>; Thu, 26 Mar 2020 23:49:41 +0000 (UTC)
Received: from sonic306-28.consmr.mail.ne1.yahoo.com
	(sonic306-28.consmr.mail.ne1.yahoo.com [66.163.189.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-144-t5KHdn46Pw2ls3WNuItTGg-1;
	Thu, 26 Mar 2020 19:49:39 -0400
X-MC-Unique: t5KHdn46Pw2ls3WNuItTGg-1
X-YMail-OSG: y2tTfyEVM1l6UZ5RmYTqLFHWkemfU18R1iSQtfl94_Q_zFJklPG5xiinX75FxXZ
	dS4tEN7_zw13RA91ppKPIwtJU45a3UJFsFA6t0556v8FlwHnHbf2eoXdzHsxWUTkYVC7LsAqQBLM
	ZQNY2yIDounBawVgn77hWNShClD7W_qG1geQa23FeKNmO9VFhCuXxHBRzZ7dRve_kBLDlkhrt4_9
	uW.BripPpDsXUOpoQnto8TSSRPzcsI8P42ZmKvrZCU5Xagd.EYTVEQZBF6Xnc4yh1Yu_Qr9pRPJY
	4t0kwiOj2VXVVTtDYmjiSJLMmphAd06p3pZRxEIX77IMATuEq52Gs.89Ai_FLFgHrOkhRn6AWsjX
	8grqBRHFElT1_d6Ep5vdNj4etYAoGIchmlqWxxss5P8LMooXhzqEtnGZ5KqDTMYde3dWk.wrKxUI
	ahpRV6qr4gGwHFZ7XU3vqIZeMd.32RTHXnXrKefBnIMqbj_Jg6hJuMer6mu63k4WAcnjVf0s7Sgg
	VOhKAkezmfbbwImXTcGMmERisxi2YbAzvQx5UsCEvwQZibIQtFhpry8Z9hwiAplkcoEmY_TE8_P.
	rk6gO5ukfyLs6BpTFdHNxeISCVWkgQQo4NUchO4ORMwS7qfDwU9FZEjpWRM9Q82Hpyd9DjOx0s0b
	LYRw6QyHIdL7eB3oGKQZxfxqpnUkLEqJkfB1h9V4E.gxaqZpYx_H8_gmnX7FTPLzojNQGEAgDhQl
	fYLRWsY4tEX3BugG.GJoj7Rp.FywWk8m1HEY7eigfHiAc6f5fQYeqP85xzdj5G.8qwwp_PJflmIp
	.7x5TdZ6_iZtUmbl3CSsY3imf2WMcFaqJ.cJvajc..TGAUR9ulqaUFnJe3KJiIfJctJIzbLbOfZP
	wpwyyQaL3TQtqaTM7y8FWU3z1kb0Wm8PzvP7mhJ0K1tfdhMbU63NcOLDwa4v1SOMazu9tEqq5FS9
	5d.kgTKs50t2keR5kVsKPiw3ogU6vH6XWNDhWC0HQVJRY0Zeydlk33cKmrzxPdobAkwk8Eaf.0rd
	.sgfuMEBEd0pNy8H1tUAYc2cBIrpnGsEr8CpAsMHnP2gx7ZQyLwYMapGM5S6.E1FNcNL9YT2J7NU
	JjYrszuqVq0pSWHG2mcW0ygytuEncMVVMcNviDZ2sF64obLCkatNm8Pz7rJ09Y82EzzuiWWE8WNB
	EqNyQNKeXTFNrIdYqb20ZOhytsaE4hDdE4uMNJQwjuHm10k_gOqEZjso5jwWbjG_Nu_5dEUiYvpg
	eE6VO5UF78La3mwmgMVh_d.Y5engT2jmoc_Z6GQaZ3rzLUCq6wI7TUzqAw.RufdxhugjK_JNQxb9
	x1ZKZ4Pd_nXUMYEVs.DNzXYGO7aYDBmx1ka3TOSgysKAJgbTF65Fgws31HJX__s_U5TH5nDErkVt
	bUAaK7zZ3m49E0yTqeA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 26 Mar 2020 23:49:38 +0000
Received: by smtp402.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 923f1e145d1b527bcd9141ca8a2572d4; 
	Thu, 26 Mar 2020 23:49:33 +0000 (UTC)
To: Steve Grubb <sgrubb@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Audit record ordering requirements
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <de87d7bb-a7df-0251-0f33-9aeeef3d0879@schaufler-ca.com>
Date: Thu, 26 Mar 2020 16:49:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
References: <de87d7bb-a7df-0251-0f33-9aeeef3d0879.ref@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02QNnhQC014972
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I'm looking at adding an audit record type for the case where
there are multiple security modules providing subject data. There
are several reasons to create a new record rather than adding the
additional information to existing records, including possible
size overflows and format compatibility.

While working with the code I have found that it is much easier
if the new record (I'm calling it MAC_TASK_CONTEXTS) can be generated
before the "base" record, which could be a SYSCALL record, than
after it. Can I get away with this? I haven't seen any documentation
that says the CWD record has to follow the event's SYSCALL record,
but I wouldn't be at all surprised if it's implicitly assumed.

Thanks.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

