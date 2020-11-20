Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1F392BB5B6
	for <lists+linux-audit@lfdr.de>; Fri, 20 Nov 2020 20:46:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-Fh6gKsWWM9aVecwRIJtajg-1; Fri, 20 Nov 2020 14:46:10 -0500
X-MC-Unique: Fh6gKsWWM9aVecwRIJtajg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB6F2801B1E;
	Fri, 20 Nov 2020 19:46:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37CC519C71;
	Fri, 20 Nov 2020 19:46:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7729B180954D;
	Fri, 20 Nov 2020 19:45:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKJjhNZ024277 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 14:45:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1AB402166B2B; Fri, 20 Nov 2020 19:45:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 162B72166B28
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 19:45:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B886B1871BF4
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 19:45:40 +0000 (UTC)
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-347-VwW__xFeOj6W42lfAS37Ww-1; Fri, 20 Nov 2020 14:45:38 -0500
X-MC-Unique: VwW__xFeOj6W42lfAS37Ww-1
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	0AKJi00j068302
	for <linux-audit@redhat.com>; Fri, 20 Nov 2020 11:44:03 -0800
Message-ID: <5FB81CBD.7040500@tlinx.org>
Date: Fri, 20 Nov 2020 11:45:01 -0800
From: "L. A. Walsh" <linux-audit@tlinx.org>
User-Agent: Thunderbird
MIME-Version: 1.0
To: linux-audit@redhat.com
Subject: Identifying thread/process termination
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2020/11/16 05:43, Paul Moore wrote:

> The most important thing to keep in mind is that all of the threads
> inside a process share the same memory space.  It is the lack of a
> strong, enforceable boundary between threads which makes it difficult,
> if not impossible, to view threads as individual entities from a
> security perspective.
---
    Depends on how much your security policy relies on recognizing
abnormal behavior.  If a program splits function across well defined
areas by a named thread, one may develop a baseline of "normal"
functionality associated with given threads.  Determining that
a thread is operating outside it's normal range can allow for a
earlier detection and better monitoring of "safe" and/or secure
operation.

    How programs operate, especially in regards to what work is
normal for a given thread can only be done with thread level
monitoring.  While given threads _can_ access global-user memory,
that involves how they are coded or programmed to run.  That, in
turn, can be used to help define boundaries and integrity levels
of various processes in a system. 

    For example, even though a logging thread might gather data
from other threads, knowing that it can only write to output
to specific configured destinations would allow swift detection
of aberrations.





--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

