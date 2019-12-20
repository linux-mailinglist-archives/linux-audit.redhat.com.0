Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 676FE1282AB
	for <lists+linux-audit@lfdr.de>; Fri, 20 Dec 2019 20:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576869850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mPApS4w2LaaoF8fyElsksNmjYOyGGVUoHugHcyRApzE=;
	b=YKPVbTn/pP1i0Siy9ymiexhU8l5/QjfMSX5P2bUMj0qdbA4yUTBKUWJTxqlEy7dGiPm5rW
	P+c29fu8MUJVhxU6lTmsNcfSjNjEL1a4ulGGleVE+aBhTw1mmrd2aUa36e8766uoSf3y5n
	I8gQdBZiGhThmZoJMOXESV56oc6UQlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-ZOkLhzoaO0KCnsKgoEwdMA-1; Fri, 20 Dec 2019 14:24:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C70AE800D50;
	Fri, 20 Dec 2019 19:24:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C81C15DA2C;
	Fri, 20 Dec 2019 19:23:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 205F9252EB;
	Fri, 20 Dec 2019 19:23:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBKJNcUr009587 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Dec 2019 14:23:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0712360495; Fri, 20 Dec 2019 19:23:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-51.phx2.redhat.com [10.3.117.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB1360576;
	Fri, 20 Dec 2019 19:23:35 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: ausearch on the fly
Date: Fri, 20 Dec 2019 14:23:34 -0500
Message-ID: <1765069.Uqzcf1Iu7r@x2>
Organization: Red Hat
In-Reply-To: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D9542982304BF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ZOkLhzoaO0KCnsKgoEwdMA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, December 20, 2019 8:33:11 AM EST MAUPERTUIS, PHILIPPE wrote:
> We are centralizing  the audit logs with rsyslog.
> The SIEM behind the central log server is unable to process the raw logs.
> We would like to push the ausearch  result in CSV format in real time or
> near real time. Is there a way to have ausearch working from a pipe and
> and waiting when no logs are received

I think that I've seen others who setup a cron job and use the checkpointing
feature so that they do not miss anything. You can pipe its output into
logger. You probably also want to cut the first line which has the column
headers.

ausearch --start today --checkpoint /root/last-ausearch .chpt --format csv | tail -n +2 | logger

Also, the latest syslog plugin can now do interpretation. I think its in
alpha-9 which dates back to Nov 04, 2019. 

It really shouldn't be hard to copy and paste the code from ausearch into the
syslog plugin to log directly in that format. I wonder if anyone else would
find that useful?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

