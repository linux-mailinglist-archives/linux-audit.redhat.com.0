Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8A2195922
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 15:37:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585319821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BQi9i5B/NQfQGYCnw9xecg0o8pDOkTW0yNP2jGvSkJw=;
	b=Wk0ZO1y2Rkgvmb0BeYgZBJs8Fqwl5+RIyRArTLOlbQlVlrlklEAuYaRa+PQ6Tcq3a2ODnY
	3U4ADxPLy2wpWLVUBw3cay/HOgLUYFrqVbCXid+dJ2GnY4L9YoZa2kzG5var594mXYYeSa
	5Aat4ULI37dHG+e7bVDU4AV14A4qFtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-VOAUP3T9MdmETeiBUf9lkA-1; Fri, 27 Mar 2020 10:36:59 -0400
X-MC-Unique: VOAUP3T9MdmETeiBUf9lkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D841E8010CA;
	Fri, 27 Mar 2020 14:36:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F25419756;
	Fri, 27 Mar 2020 14:36:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35526182B00F;
	Fri, 27 Mar 2020 14:36:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02REad6C008565 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 10:36:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F18BA60C63; Fri, 27 Mar 2020 14:36:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8606260BF4;
	Fri, 27 Mar 2020 14:36:37 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Full shell access or sudo command
Date: Fri, 27 Mar 2020 10:36:33 -0400
Message-ID: <1930026.6Tes88mm62@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D95429807639D60@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D95429807639D60@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, March 27, 2020 5:15:37 AM EDT MAUPERTUIS, PHILIPPE wrote:
> Hi,
> Our sysadmins are able to use sudo to take a root shell and do whatever
> they want. On the contrary, application managers for example have only a
> limited set of sudo scripts and commands Is it possible to find if a given
> audit message (for example due to a watch on a file) has been  issued in
> the context of sudo or a shell? My goal is to be able  to search for
> potential sudo abuse through misconfiguration.

Assuming direct root login is disabled since root is a shared account, then 
any event with uid ==0 and session != -1 has to be under sudo/su.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

