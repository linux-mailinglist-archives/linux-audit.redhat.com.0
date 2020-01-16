Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EF1C813FB70
	for <lists+linux-audit@lfdr.de>; Thu, 16 Jan 2020 22:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579210210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ypqk/UTXscMIP8EQYXxSuI3c3lWgR4R8kmbW0A/r2Ps=;
	b=MQfmDKsaC8wmuAACjasvUsvXQ0hNYsK31xQ2UoizT2bScrtYBCsL6qu8l1Dx9mixSNiDsG
	otD+8b3zwVkaGWrwC4khpuiqEYFYOxwIps4lyenoHxkwnOsrKS5j/0BiIN5LKIR4MVk4cC
	U/SBriTr5XSJfU08m2eCxYRDH1ibads=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-8d0liTHDMViNiq1Valts0A-1; Thu, 16 Jan 2020 16:30:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C54601005510;
	Thu, 16 Jan 2020 21:30:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C695660C84;
	Thu, 16 Jan 2020 21:30:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AE1F845F2;
	Thu, 16 Jan 2020 21:30:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00GLTuwV016885 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 16:29:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 98123101F942; Thu, 16 Jan 2020 21:29:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0681001901;
	Thu, 16 Jan 2020 21:29:48 +0000 (UTC)
Date: Thu, 16 Jan 2020 16:29:46 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Subject: Re: [PATCH ghak25 v2 1/9] netfilter: normalize x_table function
	declarations
Message-ID: <20200116212946.mwnk45v2px4e42uj@madcap2.tricolour.ca>
References: <cover.1577830902.git.rgb@redhat.com>
	<194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
	<f8ee5829-f094-96b8-40c2-b0278f93fb03@6wind.com>
MIME-Version: 1.0
In-Reply-To: <f8ee5829-f094-96b8-40c2-b0278f93fb03@6wind.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
X-MC-Unique: 8d0liTHDMViNiq1Valts0A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2020-01-08 17:47, Nicolas Dichtel wrote:
> Le 06/01/2020 =E0 19:54, Richard Guy Briggs a =E9crit=A0:
> > Git context diffs were being produced with unhelpful declaration types
> > in the place of function names to help identify the funciton in which
> > changes were made.
> Just for my information, how do you reproduce that? With a 'git diff'?

git format-patch is how it is presenting as a problem, which I assume
would also be git diff.

> > Normalize x_table function declarations so that git context diff
> > function labels work as expected.
> >=20
> [snip]
> >=20
> > --=20
> > 1.8.3.1
> git v1.8.3.1 is seven years old:
> https://github.com/git/git/releases/tag/v1.8.3.1
>=20
> I don't see any problems with git v2.24. Not sure that the patch brings a=
ny
> helpful value except complicating backports.

It brings value to anyone who is on a distro that is stable and only
slightly behind.  There are other features of git 2.x that I'd like to
start using (git worktrees) but I'll have to wait until I can afford to
upgrade.

> Nicolas

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

