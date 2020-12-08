Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6CA2D2C28
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 14:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607435111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jFSEQzIOrVV+hOhJ8PC16ibXC+x76d/zBfaI9P1KuzQ=;
	b=MLoEBiHDG9gLAsPOZf0zrvI5pQ0TjZPU9oEFlYjGuESVOTPMO4/u0J3c6/l2dv7hhd5sha
	zNjcrrM6TNPMLaiPJ1XUMnPEvusaNVudjBjpv/swwzYzN38zrje1eY6e9N/j5c+qUMuWZF
	hYI3RggRMEWRAn+LQPV3m1/vq/AXPPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-OpxpfSkZMni54o0YirgDTw-1; Tue, 08 Dec 2020 08:45:07 -0500
X-MC-Unique: OpxpfSkZMni54o0YirgDTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6C56129E;
	Tue,  8 Dec 2020 13:45:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5E865D6D5;
	Tue,  8 Dec 2020 13:45:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D70D180954D;
	Tue,  8 Dec 2020 13:44:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8Diqo8019932 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 08:44:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50D8D19D9B; Tue,  8 Dec 2020 13:44:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-157.rdu2.redhat.com [10.10.113.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B092519D9D;
	Tue,  8 Dec 2020 13:44:45 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Date: Tue, 08 Dec 2020 08:44:43 -0500
Message-ID: <2563857.mvXUDI8C0e@x2>
Organization: Red Hat
In-Reply-To: <20201208132003.GW1762914@madcap2.tricolour.ca>
References: <20200701213244.GA1817@linux-kernel-dev> <5414845.DvuYhMxLoT@x2>
	<20201208132003.GW1762914@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, December 8, 2020 8:20:03 AM EST Richard Guy Briggs wrote:
> > > By configure macro are you talking about the presence of that audit
> > > status mask bit, or the presence of that struct audit_status member?
> > 
> > Yes. But it doesn't apply to old kernels.
> 
> An "or" question usually needs one or the other reply unless both are
> true...  Which one were you talking about?

Either. You shouldn't have one without the other. We just need to handle old 
user space/new kernel & new userspace/old kernel gracefully.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

