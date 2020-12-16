Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 90C4D2DC885
	for <lists+linux-audit@lfdr.de>; Wed, 16 Dec 2020 22:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608155597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dy/w4yAaXhEdESyNp7Zb+k/yGVj1aZr/vI1CyY7R1ss=;
	b=drxiaw1z1iFXSBgBOPJ8rZe4ct0MxnRnOEB8EqiU3BVdKY6FvKB7BO24q+Do2EnVgJLul1
	X4GUF/dV3xIjLIQKzAbTmsXfrFJKAEDkjsmOVVd5kXgk5QNyQotkPJ0bUMNIirr1WoXSZw
	pa3B8llx7S1XzfI2uIJ/OUAYjov3KTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-I8UhotVBPJ-eWXGJWNJwmw-1; Wed, 16 Dec 2020 16:53:15 -0500
X-MC-Unique: I8UhotVBPJ-eWXGJWNJwmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9A25801817;
	Wed, 16 Dec 2020 21:53:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD2617577;
	Wed, 16 Dec 2020 21:53:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 064A9180954D;
	Wed, 16 Dec 2020 21:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BGLqotp009384 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 16:52:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E4E6A60CD0; Wed, 16 Dec 2020 21:52:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-10.rdu2.redhat.com [10.10.117.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD5D260CCC
	for <linux-audit@redhat.com>; Wed, 16 Dec 2020 21:52:47 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: audit 3.0 released
Date: Wed, 16 Dec 2020 16:52:46 -0500
Message-ID: <8734089.CDJkKcVGEf@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I've just released a new version of the audit daemon. It can be
downloaded from http://people.redhat.com/sgrubb/audit. It will also be
in rawhide soon.

The ChangeLog is too big for this email. There are a lot of new things, bug 
fixes, code cleanups, documentation improvements. It was branched from 2.8.3 
and represents almost 3 years of work. Some of the bugfixes were backported 
and that is what 2.8.4 and 2.8.5 were. 

Architecturally, audispd is gone. Auditd now handles plugins. But this hasn't 
changed relative to the alpha releases being pushed out over the last couple 
years.

SHA256: bd31826823b912b6fe271d2d979ed879e9fc393cab1e2f7c4e1af258231765b8

Please let me know if you run across any problems with this release.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

