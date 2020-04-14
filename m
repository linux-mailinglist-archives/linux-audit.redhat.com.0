Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D51A1A7758
	for <lists+linux-audit@lfdr.de>; Tue, 14 Apr 2020 11:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586856506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uUPixNnEKILSnT41lTxPhdD1s9fm7kUzlUcq/MyPpu4=;
	b=iA+mQSNF2WynhKJyzQa1qFWjq9XUsE4rXeMKYnPyI7YKZzGgyMjUjp9xe3WSf4KvSy7nv9
	SuVBALL1sm4O/YQdSAlhATbPPYW8qqthtzT4rdJ9shTpnn0DEdocIeksvLan+tPjR9YPC+
	7ceeC1LCBbswPReXlnTLBS50cVVDdXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-fhrSCR3GPRe-803451rH_A-1; Tue, 14 Apr 2020 05:28:24 -0400
X-MC-Unique: fhrSCR3GPRe-803451rH_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F35018FE860;
	Tue, 14 Apr 2020 09:28:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F110A9F9B0;
	Tue, 14 Apr 2020 09:28:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55282938E2;
	Tue, 14 Apr 2020 09:28:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03E9Rnct018391 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 05:27:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60F6FD961B; Tue, 14 Apr 2020 09:27:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D57DD9616
	for <linux-audit@redhat.com>; Tue, 14 Apr 2020 09:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C5C1868CA8
	for <linux-audit@redhat.com>; Tue, 14 Apr 2020 09:27:47 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-298-RUAgwug8MLqlQlaPEtcDqQ-1; Tue, 14 Apr 2020 05:27:45 -0400
X-MC-Unique: RUAgwug8MLqlQlaPEtcDqQ-1
Received: by mail-wm1-f71.google.com with SMTP id b203so3536603wmd.6
	for <linux-audit@redhat.com>; Tue, 14 Apr 2020 02:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:organization
	:mime-version:content-transfer-encoding;
	bh=SxSROYqLTKpTqFgCwZDnIarDCWLcC5QhOz3mPhfxMmo=;
	b=A7RDD5VeFSBqK7XjrfvsRucsHbbCjoHXBsp5PPZZg3Asc+UG958PYxXLkQMIzU6v9q
	5UCqIKZHMmwueSkEWVQ3Bs4YWzOTiruVlk5KYir+W12IB4GceC0Y/D4S6utXLyngVKe6
	PPXAVv/T3EsvChGmgp08cehoUwTAq0EIFgVKGFA//Regerpky0ZtyLdC+dVI5GaJpEPW
	zQ0ew5L3u1k/Rer6/BDbhKwTY0jg03CyNmttl/H7PCWpq3cybZqN/ksHBy49RMnVW6hj
	ZgNAYTkY5B+LcE75OL+162kmIv370DG6j/GibPAjmB6nLGXlKT5wHMo0HNOvuggQFL8u
	xmTg==
X-Gm-Message-State: AGi0PuZ6+tINDgnGG+LW70BaDb/UyJNPdZtEHrBNV7wILnkBim/ZeLy+
	xR7A184RD2wAsdPV3rs/MkDbChQfMY7WstDyQWlV0AjOkUQoCeTHFHgiwbfxLt/gw51n3HTXWbc
	2LPsbT34OZlfWfDblQ+M=
X-Received: by 2002:a5d:460b:: with SMTP id t11mr20194748wrq.319.1586856464040;
	Tue, 14 Apr 2020 02:27:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypLYmzcvQhFw88gUiQ3/XoaMRfqRuv01v7zQFsB+Txt7xtKtUo0bm/i1xx50sIKSqk/dKHGedQ==
X-Received: by 2002:a5d:460b:: with SMTP id t11mr20194718wrq.319.1586856463789;
	Tue, 14 Apr 2020 02:27:43 -0700 (PDT)
Received: from xantho ([2a02:8109:9c80:3b08:8460:68f:8173:5dda])
	by smtp.gmail.com with ESMTPSA id
	h188sm19022096wme.8.2020.04.14.02.27.43 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Apr 2020 02:27:43 -0700 (PDT)
Date: Tue, 14 Apr 2020 09:27:40 +0000
From: Luca BRUNO <lucab@redhat.com>
To: linux-audit@redhat.com
Subject: multicast listeners and audit events to kmsg
Message-ID: <20200414092740.2fdf0f78@xantho>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,
I'm trying to re-spin a very old thread related to multicast listeners
and audit events to kmsg.

One surprising kernel behavior when using only a multicast listener
to collect audit events (in this case, systemd-journald) is that
audit events end up spamming the console [0].

[0] https://github.com/systemd/systemd/issues/15324

After a bunch of digging, it seems like this is due to a long-standing
RFE on the kernel side [1] (plus further references on BZ and LKML).

[1] https://github.com/linux-audit/audit-kernel/issues/102

Apparently there isn't a clear consensus on how this should be
approached. Looking at the github and bugzilla tickets, it seems to me
that Eric and Paul initially had in mind some logic based on multicast
listener detection, while Richard doesn't deem that reliable and
suggests an explicit configuration.

I'm not personally knowledgeable enough to judge kernel-land
approaches (nor to implement them), but I'd be happy if the audit folks
could converge to a consensus on how to implement this RFE, how it
would be consumed by userland, and what would be the kernel default
behavior once this RFE is implemented.

For Richard and the "explicit configuration" approach in particular, I'm
missing some further details:
 * Is the current behavior considered buggy, or is that intended to be
   kept as the default?
 * Would this be tweaked via a (boolean?) sysctl, and what would be the
   semantics of flipping it?
 * How would this play with namespacing, especially netns?

Ciao, Luca

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

