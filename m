Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 650C4E00E7
	for <lists+linux-audit@lfdr.de>; Tue, 22 Oct 2019 11:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571737258;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uSVo6DfKEC6IXv4wqnVsAoPbhLsGIItDBc22qFXQIEA=;
	b=Uv2476GXj8DzKezfqLEHYId9YOcALAbuY0BdTr4Sz4aebfyW9/xUFNtHgwjEJ96OHoL79z
	KtMVoj5z8MJNoUVmdYHnkGZNT9dTNcB/dshWPg0Cxra0dN4ydUnT8fjuE4tb8o+77l2i49
	+yySrDNqu9z+6oY87C9Egver3CFPdbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-IkE6iDeHO-ejijoEa-_u6A-1; Tue, 22 Oct 2019 05:40:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BADE107AD33;
	Tue, 22 Oct 2019 09:40:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 424F6413A;
	Tue, 22 Oct 2019 09:40:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1F441803B5A;
	Tue, 22 Oct 2019 09:40:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9LJrc2q006778 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 21 Oct 2019 15:53:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34AFE6060D; Mon, 21 Oct 2019 19:53:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F1B860610
	for <linux-audit@redhat.com>; Mon, 21 Oct 2019 19:53:35 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F36C085543
	for <linux-audit@redhat.com>; Mon, 21 Oct 2019 19:53:32 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id a22so14683097ljd.0
	for <linux-audit@redhat.com>; Mon, 21 Oct 2019 12:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B3ZB5cTWc/+E0YKg8QEclL2Ljwj65q5hsf0zgj4Z+rY=;
	b=DbuCNgf1Jdcb1fHz5dVod7Zb/hvdXTO2sBkYkd3wTpbCC4DFtHmDnylcsdWokKTDSL
	HhA9I/qzgi3GKe6APXdfuhH7QKnqFZVpg8bv/eGul9Sp4nmfo7N7bzrvp98Sy7x94bHT
	jHMY6nhAoMBg5QKAQ5Z6xrfbLAeruIM3UpWt2wxLCJwK7Mf+ttIeruqAme+B/cusHEFp
	3MrugkKllRlJAsDGZ4pvwkkvbfrM/NGaidC5s4jmwKQmq62JAB9NTq6WQraZo08n5BRV
	iwAytREzjY+p4g+6xc2zcnVUpZpzjkT+nxZJoSSzBF+BdqPvONu+3GGUU3mert5twyZv
	x2Jg==
X-Gm-Message-State: APjAAAXfQsO4pK4edZoFdSZOYZwF8pEFwzD4Yi+182qNLBTOaaQDZizc
	1z09XBdzO8GyRXQ99P0b8aUUCUJR1xK6nz0lkZH9
X-Google-Smtp-Source: APXvYqwGLlTHAz4uYJDRoYV7X3sKMFSAWJhdAvt0BgqLKoPKw91r1AdS6gVNJnxX99zDNcARmS/mrYca8VZXodUJ0TA=
X-Received: by 2002:a2e:5b82:: with SMTP id m2mr394137lje.184.1571687611172;
	Mon, 21 Oct 2019 12:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
In-Reply-To: <20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Oct 2019 15:53:20 -0400
Message-ID: <CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 21 Oct 2019 19:53:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 21 Oct 2019 19:53:33 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-MC-Unique: IkE6iDeHO-ejijoEa-_u6A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 9:39 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-09-18 21:22, Richard Guy Briggs wrote:
> > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> > process in a non-init user namespace the capability to set audit
> > container identifiers.
> >
> > Use audit netlink message types AUDIT_GET_CAPCONTID 1027 and
> > AUDIT_SET_CAPCONTID 1028.  The message format includes the data
> > structure:
> > struct audit_capcontid_status {
> >         pid_t   pid;
> >         u32     enable;
> > };
>
> Paul, can I get a review of the general idea here to see if you're ok
> with this way of effectively extending CAP_AUDIT_CONTROL for the sake of
> setting contid from beyond the init user namespace where capable() can't
> reach and ns_capable() is meaningless for these purposes?

I think my previous comment about having both the procfs and netlink
interfaces apply here.  I don't see why we need two different APIs at
the start; explain to me why procfs isn't sufficient.  If the argument
is simply the desire to avoid mounting procfs in the container, how
many container orchestrators can function today without a valid /proc?

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

