Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E19D81445BD
	for <lists+linux-audit@lfdr.de>; Tue, 21 Jan 2020 21:17:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579637847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JKySu6rMzmrF0FnPnwhYMiY7bgxboqcDq+A/2TIa9IM=;
	b=DwHKxTSH6h8GOk7FhlBokExlRmtmaO/tzYStgQFvm2Yiq43JMn+SoaswCOLebckefjw6iY
	3YUpa0l8r0xSwOzUqKt4/lhPTtQ+xT7c2hoA6ZScf0U+WcwbF1A3m/dKHe66RtihjdgLCW
	8oWbGqX6L10FdXY401Z6xPkSeX9haJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-KWjrovyFPCy3yhZZLbYO7g-1; Tue, 21 Jan 2020 15:17:24 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E1198017CC;
	Tue, 21 Jan 2020 20:17:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB945C1C3;
	Tue, 21 Jan 2020 20:17:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5272481985;
	Tue, 21 Jan 2020 20:17:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LKH2RF016490 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 15:17:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6DA05DA76; Tue, 21 Jan 2020 20:17:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 814915DA75;
	Tue, 21 Jan 2020 20:16:56 +0000 (UTC)
Date: Tue, 21 Jan 2020 15:16:54 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>
Subject: auditing removable media
Message-ID: <20200121201654.wezzozvsgbf57oz5@madcap2.tricolour.ca>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-MC-Unique: KWjrovyFPCy3yhZZLbYO7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Burn, and all,

I've been aware of this issue for a while now, but wasn't directly
working on it.  Now that I'm taking a closer look at this issue, I am
wondering how much USBGuard changes the equation?

https://www.kernel.org/doc/Documentation/usb/authorization.txt
https://usbguard.github.io/
	https://github.com/USBGuard/usbguard

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard

It has tools to generate baseline lists of devices, but this is only for
usb.  Other interfaces would need to be appropriately instrumented.

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

