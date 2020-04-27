Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8F41BB1BD
	for <lists+linux-audit@lfdr.de>; Tue, 28 Apr 2020 00:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588028252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tC9oDxk0TBCmcpEWHb7hms5ZY+UMWoToGp9DUs1cMjw=;
	b=BFqo+4WSWUia+6bMIRR9Plcw1Y2fatAFMuPtf1ov3mJlx9IGvJ+HhaUiK2XYIA2utM/N8s
	fMUkRBAHWluDjMJVwM+tpRafDhmzpZLLvQquNHUcRDtwtaDprC0ynrNmR4sXow9PEJqN6m
	c9pMuJS5bB07Qyxod6Fqr+5xKWo6/cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-oRVeA_awPcq8wuulIiNyiA-1; Mon, 27 Apr 2020 18:57:30 -0400
X-MC-Unique: oRVeA_awPcq8wuulIiNyiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA661009442;
	Mon, 27 Apr 2020 22:57:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB6825C1B2;
	Mon, 27 Apr 2020 22:57:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E33CA4CAA0;
	Mon, 27 Apr 2020 22:57:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03RMusY9002097 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 18:56:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0638A2026E1C; Mon, 27 Apr 2020 22:56:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 026B12026D69
	for <linux-audit@redhat.com>; Mon, 27 Apr 2020 22:56:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D2E2811E77
	for <linux-audit@redhat.com>; Mon, 27 Apr 2020 22:56:51 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-148-p5eisU5tN2S-p3wnHtv-gw-1; Mon, 27 Apr 2020 18:56:48 -0400
X-MC-Unique: p5eisU5tN2S-p3wnHtv-gw-1
Received: by mail-ej1-f68.google.com with SMTP id q8so15635255eja.2
	for <linux-audit@redhat.com>; Mon, 27 Apr 2020 15:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6oP4VlaFSgV7ud2KRpDv5BaL13F0F42IcKqjskFrEBY=;
	b=IGDRAuRObU8y1qJK0lGeUUo4poUji3ptxzj8+zguRW7D1+bvVoeXHXBb+HsktABGUY
	Yrt9fu8lZ0/AchMpZT6s9U1v9n9QZyhavfKGwnL1LKNhe8Zuux39VurVUqutnRbVcdhs
	CCGyUkC0ig+Hu+V2WZl0VGiIunKLUwaExEiwceVsDRZN4P5oadHbttqXQFzawYdW+ax/
	+AFkiKNnUHZLgFxFbRai+U2k4Ys4XwlmaaRp6JH4uoIVKnOiA04VPyCu7rMoQkTVNHPi
	YURbvRUirVpr9gMJ70lr1ybxe8q8Z0MXy2Fm5/OEGr5YIpVJhDJ9k+haOMBQyDoX+6Y4
	qv7w==
X-Gm-Message-State: AGi0PuauS3l4jcbaeZQgq5q6jjDQuXEjDwBsRzT+iFcqyweEm3v98yAM
	e1gePWEQ6oEP8Opal6TxXZeI/mgxTQAgzrLfRXSU
X-Google-Smtp-Source: APiQypKPv6cRsPxh1oTswoSINDboSrGOzuhuDMenrI+BBkA39rvw12ROJ4ljCzKcT7J6ZOvXFB4ZgjG27XHE9S5zQYQ=
X-Received: by 2002:a17:906:d7a2:: with SMTP id
	pk2mr22931365ejb.272.1588028207028; 
	Mon, 27 Apr 2020 15:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <3623b9dba8068d1488681f62683bb42ad3f4debb.1587571187.git.rgb@redhat.com>
In-Reply-To: <3623b9dba8068d1488681f62683bb42ad3f4debb.1587571187.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Apr 2020 18:56:35 -0400
Message-ID: <CAHC9VhRtPKdWmnD7Sh-ZW8S1y9xsPsgWKGcvYQD86AT7JYP2gQ@mail.gmail.com>
Subject: Re: [PATCH ghak28 V8] audit: log audit netlink multicast bind and
	unbind events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03RMusY9002097
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@parisplace.org>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 22, 2020 at 5:37 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Log information about programs connecting to and disconnecting from the
> audit netlink multicast socket. This is needed so that during
> investigations a security officer can tell who or what had access to the
> audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> Criteria.
>
> Here is the systemd startup event:
> type=PROCTITLE msg=audit(2020-04-22 10:10:21.787:10) : proctitle=/init
> type=SYSCALL msg=audit(2020-04-22 10:10:21.787:10) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x19 a1=0x555f4aac7e90 a2=0xc a3=0x7ffcb792ff44 items=0 ppid=0 pid=1 auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=unset comm=systemd exe=/usr/lib/systemd/systemd subj=kernel key=(null)
> type=UNKNOWN[1335] msg=audit(2020-04-22 10:10:21.787:10) : pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
>
> And events from the test suite that just uses close():
> type=PROCTITLE msg=audit(2020-04-22 11:47:08.501:442) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> type=SYSCALL msg=audit(2020-04-22 11:47:08.501:442) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x563004378760 a2=0xc a3=0x0 items=0 ppid=815 pid=818 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> type=UNKNOWN[1335] msg=audit(2020-04-22 11:47:08.501:442) : pid=818 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
>
> type=UNKNOWN[1335] msg=audit(2020-04-22 11:47:08.501:443) : pid=818 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
>
> And the events from the test suite using setsockopt with NETLINK_DROP_MEMBERSHIP:
> type=PROCTITLE msg=audit(2020-04-22 11:39:53.291:439) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> type=SYSCALL msg=audit(2020-04-22 11:39:53.291:439) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x5560877c2d20 a2=0xc a3=0x0 items=0 ppid=772 pid=775 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> type=UNKNOWN[1335] msg=audit(2020-04-22 11:39:53.291:439) : pid=775 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
>
> type=PROCTITLE msg=audit(2020-04-22 11:39:53.292:440) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> type=SYSCALL msg=audit(2020-04-22 11:39:53.292:440) : arch=x86_64 syscall=setsockopt success=yes exit=0 a0=0x7 a1=SOL_NETLINK a2=0x2 a3=0x7ffc8366f000 items=0 ppid=772 pid=775 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> type=UNKNOWN[1335] msg=audit(2020-04-22 11:39:53.292:440) : pid=775 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
>
> Please see the upstream issue tracker at
>   https://github.com/linux-audit/audit-kernel/issues/28
> With the feature description at
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-Socket-Join-Part
> The testsuite support is at
>   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-join
>   https://github.com/linux-audit/audit-testsuite/pull/93
> And the userspace support patch is at
>   https://github.com/linux-audit/audit-userspace/pull/114
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>

Merged into audit/next.

I like when examples of the audit records are included in the commit
description, but in the future it might be a good idea to line wrap
those records between the fields when the records are excessively long
(I would further suggest a hanging indent to ease readability).

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

