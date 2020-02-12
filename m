Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 97C0515AA70
	for <lists+linux-audit@lfdr.de>; Wed, 12 Feb 2020 14:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581515640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YQwc1l7GcXa7kxKmh2seAYDWC7Ay5W4mBz4LmBtSMkA=;
	b=GyvNXbZ03oDENzLM/1/KE99Zmdxr54ONG8qJAvGU+Duh5FoYuLVtwy2RPUXYOSibgoIVtM
	fANdTg8GaNHI7VZTc2tr7oGHXBIF/6Zyh0NeHp63IAQZ7sHZg8LHllr1yKPKQWzEhlURHf
	BCp5F9GyDN6AxTwFDLwfYRo0TBnW0fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-4UyOQ2wcNyG-YE9y_OffAA-1; Wed, 12 Feb 2020 08:53:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8844A89A33;
	Wed, 12 Feb 2020 13:53:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3066C26FDB;
	Wed, 12 Feb 2020 13:53:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64FAC866BD;
	Wed, 12 Feb 2020 13:53:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CDrWqZ023980 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 08:53:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BAAF5C1C3; Wed, 12 Feb 2020 13:53:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-254.phx2.redhat.com [10.3.116.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B2736684E;
	Wed, 12 Feb 2020 13:53:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Auditing a program use but not what it is doing
Date: Wed, 12 Feb 2020 08:53:24 -0500
Message-ID: <4711138.QvFmgxA1yv@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429829F549@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429829F549@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
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
X-MC-Unique: 4UyOQ2wcNyG-YE9y_OffAA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, February 12, 2020 5:01:37 AM EST MAUPERTUIS, PHILIPPE wrote:
> Like many, we are using aide and clamav.
> I woud like to have an audit record when these program are run but no
> records for what they are doing. I mean, I want to know that clamscan or
> aide has been launched but not that it checks say /etc/passwd whatever
> rules could be in place for /etc/passwd

Then all you need to do is place a watch on them.

-a always,exit -F path=path-to-aide -F perm=x -F key=something-ran

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

