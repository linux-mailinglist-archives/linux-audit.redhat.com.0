Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E2773AB8
	for <lists+linux-audit@lfdr.de>; Tue,  8 Aug 2023 16:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691504773;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QGgjsI0C5osRcM0gv1gMVCLVxZy1MB45g9E44OKOCP8=;
	b=ODnzZceRmN7qAa4hFW0TwIxou7L2vFqxPIvEYZqgRh/pGh+MldtiWgLpHGpNzj3inMbNVC
	9MyoWCO2TIM+YkEovgNm6ccser+dRqxAvHzmRAwp03UCpemgLYLEi8Nof7B1hOGuzpGCIh
	sUB6GdcGuH3WyF48Dz4brfhf2elJK/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-YwoUi5ZsMKWyDmOyKjbT3A-1; Tue, 08 Aug 2023 10:26:08 -0400
X-MC-Unique: YwoUi5ZsMKWyDmOyKjbT3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D990C85D063;
	Tue,  8 Aug 2023 14:26:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEAAA140E964;
	Tue,  8 Aug 2023 14:25:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D9B81946595;
	Tue,  8 Aug 2023 14:25:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4F5E31946586 for <linux-audit@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 14:25:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3871140C6E8A; Tue,  8 Aug 2023 14:25:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E33640BC780
 for <linux-audit@redhat.com>; Tue,  8 Aug 2023 14:25:51 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: [RFC] Future audit changes
Date: Tue, 08 Aug 2023 10:25:50 -0400
Message-ID: <4855993.31r3eYUQgx@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I am considering making some drastic changes in a future 4.0 release. This is 
partly motivated by a change in my daytime job. I am no longer working in Red 
Hat security. Therefore working on audit is officially a hobby. I have spent 
the last weeks closing out pull requests and Issues so that whoever wants to 
contribute to the audit project doesn't have a lot of history to deal with. 
There's almost 500 people subscribed to this list. The community needs to 
step up a little.

The proposed changes are:

1) Drop support for Python 2. Python 2 has lost upstream support over 3 years 
ago. I also can't see the viability of someone saying they need the latest 
audit changes for the new kernel yet they are stuck on python 2. It doesn't 
compute. This is also related to proposal 5 below.

2) Drop SysVinit support. I think everyone has changed to systemd at this 
point. This is to reduce potential maintenance.

3) This is probably the most controversial and would need careful testing: 
Split the audit service into 2 services: auditd and rules-load. These would 
be packaged in 2 different packages so that if all you want is rules-loading 
and are fine with events going to journald - have at it. If you want the 
tradition audit experience, then install the audit package which will depend 
on the rules package. The trick is making them automatically enabled at 
install. This will need testing and perhaps patches. Packagers will need to 
work with their distribution  to update systemd presets.

4) Change the definition of which events are simple (one record events) and 
compound (multiple records per event). Over the years syscall records were 
added to the simple events haphazardly. That seems to have settled down and 
we can redefine which are in which group. This is important because this 
determines when an event is complete and ready to process in ausearch,  
aureport, and auparse. This should reduce future bug reports.

5) Drop functions from libaudit python bindings that have anything to do with 
placing and removing rules in the kernel. I'd like the API to just contain 
what's needed to send audit events and query kernel status. This new binding 
would be hand written, thus possibly breaking compatibility with the swig 
generated bindinsg. Not 100% sure on that, but it might be a side effect. The 
main idea is limit the scope to reduce maintenance and future-proof kernel/
swig changes.

6) Moratorium on new arches being supported. If someone else comes along and 
really shows *sustained* support for the audit project for a while and they 
want a new arch to be supported, I might consider it. Since my work on this 
project is now a hobby, I am not inclined to make more work for my weekends.

7) Drop the autrace & auvirt programs. Does anyone actually use these? Can 
ausearch take the place of auvirt? The aim here is reduce maintenance.

Let me know what you think. I'll probably put these in a new audit-4.0 branch 
until they are complete and some testing has been done.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

