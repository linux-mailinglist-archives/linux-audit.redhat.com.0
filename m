Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A96AC2D1E55
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 00:29:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607383739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dk+OB6XVuiOYV3+zXCPbRg/h8F+cL2Sw3Yf80ei/HPE=;
	b=geTeQ9zlTUX9edxkFRgc4M5Zb/ovy7s377+JS4hLvaQjTEXc+0lQVIUXjVFsLexAC16PsY
	OcDya+V2rChLlRflrcGtHlx7BIKuTq8Etnnbkt98/FYXTN7gBebfzE92xnlWl8vJe24M7C
	CGwq40X7kNfNLzNzqHeoKvrqekepMUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-IAtTZCUbNg2TnZFL4xaoKQ-1; Mon, 07 Dec 2020 18:28:57 -0500
X-MC-Unique: IAtTZCUbNg2TnZFL4xaoKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B42BE800D53;
	Mon,  7 Dec 2020 23:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6853F19C59;
	Mon,  7 Dec 2020 23:28:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86E4A180954D;
	Mon,  7 Dec 2020 23:28:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7NSVfi003491 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 18:28:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 90D702BFF1; Mon,  7 Dec 2020 23:28:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-152.rdu2.redhat.com [10.10.113.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCB1360636;
	Mon,  7 Dec 2020 23:28:24 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Max Englander <max.englander@gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Date: Mon, 07 Dec 2020 18:28:22 -0500
Message-ID: <2046910.irdbgypaU6@x2>
Organization: Red Hat
In-Reply-To: <CAK50otWFQveN3GSBVEz07cnSR90YOb0QeiX-PJzB4W2rkJ02ow@mail.gmail.com>
References: <20200701213244.GA1817@linux-kernel-dev>
	<20201207212100.GN986374@madcap2.tricolour.ca>
	<CAK50otWFQveN3GSBVEz07cnSR90YOb0QeiX-PJzB4W2rkJ02ow@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Max,

On Monday, December 7, 2020 4:28:14 PM EST Max Englander wrote:
> Steve, I'm happy to make changes to the userspace PR based on
> Richard's suggestions, if that sounds good to you. I'll follow up in
> the PR to discuss it more

The only issue is new userspace on old kernel. I think if we use both the 
configure macro in addition to a size check, then it will at least allow 
forward and backward compatibility.

Other metrics would be good. I'd like to see a max_backlog to know if we are 
wasting memory. It would just record the highwater mark since auditing was 
enabled.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

