Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0714B1A6763
	for <lists+linux-audit@lfdr.de>; Mon, 13 Apr 2020 15:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586786327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HK1w2uyjxcHH8+r8w4plum1yTARj6v0oZnOwY/OqDFU=;
	b=Q/Ub05yo1AQRVh+oY67Kv+t12DZYDq5rYuy3YPYKZJGdgVzeVNo7Cpn7P+E4xYrSNXCTpU
	SwDS47DnQWLFTcX7DcA1RiO9WGNhIo1eixjBuaFAY6aZnkfcpbTjvBbr5gGBqf2RhMund6
	bwZn5Y0bt+HRlQ0f0suIm3AXlnUtjtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-WRPzsx-hOMifYaNMs4OFMg-1; Mon, 13 Apr 2020 09:58:45 -0400
X-MC-Unique: WRPzsx-hOMifYaNMs4OFMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 189061005510;
	Mon, 13 Apr 2020 13:58:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EDE811A274;
	Mon, 13 Apr 2020 13:58:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69AF5934E9;
	Mon, 13 Apr 2020 13:58:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03DDw5IK007305 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Apr 2020 09:58:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00A8E5C1D4; Mon, 13 Apr 2020 13:58:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-110.phx2.redhat.com [10.3.112.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECE885C1B2;
	Mon, 13 Apr 2020 13:57:59 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: auditing audispd vs kubernetes daemonsets
Date: Mon, 13 Apr 2020 09:57:58 -0400
Message-ID: <4644525.9UYIb4EAcv@x2>
Organization: Red Hat
In-Reply-To: <CAOxyEpno-VdVb3sqX8q7hGX7L3fgEOLpf9j25u_o+mcezZ+EBg@mail.gmail.com>
References: <CAOxyEpno-VdVb3sqX8q7hGX7L3fgEOLpf9j25u_o+mcezZ+EBg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Gabriel Alford <ralford@redhat.com>,
	Juan Osorio Robles <josorior@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, April 10, 2020 4:39:37 PM EDT Gabriel Alford wrote:
> In the midst of discussing sending audit logs from a Red Hat CoreOS node to
> some central audit collection and evaluation tool, the question came up
> about using audispd instead of Daemonsets. Daemonsets are what is planned
> for OpenShift. As I understand it, the general principle is to allow
> auditing to flow through the subsystem, but does it need to flow through
> the entire auditing workflow? 

I'd say that if you ask 10 people on this list, you may find 10 different ways 
they are doing it. It really depends on your requirements. Some places care 
that you don't mix security officer and system admin roles. (Security Officer may 
have a system admin under investigation.) In that case, you have to keep the 
logs separate and this is likely to a MLS system. Other, less demanding 
sites, don't care because they are one in the same. They send audit logs into 
syslog and then pick it apart later. And then there are some tools that have 
their own audisp plugin and transport the logs themselves.

> Can a Daemonset be used instead of audispd, or are there reasons audispd
> should be used over a Daemonset that some of us just aren't aware of?

Entirely up to the system architect and their security requirements.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

