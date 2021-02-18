Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 86E1231EA70
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 14:30:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-GxBmHiA_PICzCjEIdVU16w-1; Thu, 18 Feb 2021 08:30:04 -0500
X-MC-Unique: GxBmHiA_PICzCjEIdVU16w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF9F6107ACF3;
	Thu, 18 Feb 2021 13:29:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC27F60917;
	Thu, 18 Feb 2021 13:29:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72C2857DFA;
	Thu, 18 Feb 2021 13:29:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11I8MK57016383 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 03:22:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D9DC7107290; Thu, 18 Feb 2021 08:22:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D48D611902C
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 08:22:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D84485A59D
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 08:22:18 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-46-cvomlHnzNSOthlNy36qp2g-1; Thu, 18 Feb 2021 03:22:11 -0500
X-MC-Unique: cvomlHnzNSOthlNy36qp2g-1
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1lCeZb-0005qG-MU; Thu, 18 Feb 2021 09:22:07 +0100
Date: Thu, 18 Feb 2021 09:22:07 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210218082207.GJ2766@breakpoint.cc>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20210217234131.GN3141668@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 18 Feb 2021 08:29:38 -0500
Cc: Phil Sutter <phil@nwl.cc>, Florian Westphal <fw@strlen.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2021-02-11 23:09, Florian Westphal wrote:
> > So, if just a summary is needed a single audit_log_nfcfg()
> > after 'step 3' and outside of the list_for_each_entry_safe() is all
> > that is needed.
> 
> Ok, so it should not matter if it is before or after that
> list_for_each_entry_safe(), which could be used to collect that summary.

Right, it won't matter.

> > If a summary is wanted as well one could fe. count the number of
> > transaction types in the batch, e.g. table adds, chain adds, rule
> > adds etc. and then log a summary count instead.
> 
> The current fields are "table", "family", "entries", "op".
> 
> Could one batch change more than one table?  (I think it could?)

Yes.

> It appears it can change more than one family.
> "family" is currently a single integer, so that might need to be changed
> to a list, or something to indicate multi-family.

Yes, it can also affect different families.

> Listing all the ops seems a bit onerous.  Is there a hierarchy to the
> ops and if so, are they in that order in a batch or in nf_tables_commit()?

No.  There is a hierarchy, e.g. you can't add a chain without first
adding a table, BUT in case the table was already created by an earlier
transaction it can also be stand-alone.

> It seems I'd need to filter out the NFT_MSG_GET_* ops.

No need, the GET ops do not cause changes and will not trigger a
generation id change.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

