Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C23C8263558
	for <lists+linux-audit@lfdr.de>; Wed,  9 Sep 2020 20:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599674627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ForFOS4eBsFDr2Gl1AJUzY9beQm8pRZ3i+EBXo/3z4A=;
	b=etuoMXzc+pmsW/IDgkbbR1CdnPFwziiK3mFU2bsXpQyakP4IqU5oIUDnIIf2qy68Rebrv3
	Eb+bXOqkTB+rADCiguRnlsgoKGkv2QF0z9nCEo8q13hSMtwCt1ULbSctLz7M4rKXp8Rq9S
	WTFbo0Ku5zU9yCCfjFCgk5/HPFlvupo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-YY0ief-bOhCWfp_8HaW41Q-1; Wed, 09 Sep 2020 14:03:44 -0400
X-MC-Unique: YY0ief-bOhCWfp_8HaW41Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E90E51019638;
	Wed,  9 Sep 2020 18:03:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E190760C07;
	Wed,  9 Sep 2020 18:03:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D55A1826D2D;
	Wed,  9 Sep 2020 18:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089I3Ke0007922 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 14:03:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E8D15C221; Wed,  9 Sep 2020 18:03:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-197.rdu2.redhat.com [10.10.113.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 770AD5C3E1;
	Wed,  9 Sep 2020 18:03:13 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: -F perm in audit rules
Date: Wed, 09 Sep 2020 14:03:12 -0400
Message-ID: <4052904.ejJDZkT8p0@x2>
Organization: Red Hat
In-Reply-To: <CAOxyEpnvNQzBsweRmH5HTDuAY5umpoBQsLCLnEDOde7zkFZiVg@mail.gmail.com>
References: <CAOxyEpnvNQzBsweRmH5HTDuAY5umpoBQsLCLnEDOde7zkFZiVg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Gabriel Alford <ralford@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, September 8, 2020 7:02:01 PM EDT Gabriel Alford wrote:
> Hello,
> 
> By default, does auditd audit read, write, execute, and attribute in audit
> rules or do you need to specify
> -F perm=wxra ?
> 
> For example,
> 
> -a always,exit -F path=/usr/bin/at -F perm=wrxa
> 
> vs
> 
> -a always,exit -F path=/usr/bin/at

They are equivalent. Specifying -F perm= is so that you can fine tune what you 
want instead of everything.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

