Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC28466DF36
	for <lists+linux-audit@lfdr.de>; Tue, 17 Jan 2023 14:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673963256;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=faxWJWEJAyf1NeV/2Foil954i/DlhPnB4wK2tPBMkGs=;
	b=LB5CvnP5eUwyTvip8zFAkX6qrnkTpQ99NkPnkJJTQSr8lCnQD86l7E7c98nL2HNYAfAtVu
	2SD9HUz2Cfb2UoJ2AP/u9gVEmJibWfV7xR0hM5ll/rxygxpzMh26J8zWULGym8Pqk4EG9+
	m0xfbp1yTe3ijUCfQDZRWrEh/GYA1WQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-ejguxu_kOq6ktwL5S8baBg-1; Tue, 17 Jan 2023 08:47:32 -0500
X-MC-Unique: ejguxu_kOq6ktwL5S8baBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D314C3814591;
	Tue, 17 Jan 2023 13:47:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A31D8175A2;
	Tue, 17 Jan 2023 13:47:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ABCDB19465B9;
	Tue, 17 Jan 2023 13:47:22 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADFA119465A3 for <linux-audit@listman.corp.redhat.com>;
 Tue, 17 Jan 2023 08:27:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43138492B12; Tue, 17 Jan 2023 08:27:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B175492B10
 for <linux-audit@redhat.com>; Tue, 17 Jan 2023 08:27:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FB771C04336
 for <linux-audit@redhat.com>; Tue, 17 Jan 2023 08:27:28 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-516-Lk4-vFquMuqf3Hj1qEpLiQ-1; Tue,
 17 Jan 2023 03:27:26 -0500
X-MC-Unique: Lk4-vFquMuqf3Hj1qEpLiQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8821E38128;
 Tue, 17 Jan 2023 08:27:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 796E11390C;
 Tue, 17 Jan 2023 08:27:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4aCKHexbxmNxVQAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 17 Jan 2023 08:27:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id BDF5FA06B2; Tue, 17 Jan 2023 09:27:23 +0100 (CET)
Date: Tue, 17 Jan 2023 09:27:23 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
Message-ID: <20230117082723.7g3ig6ernoslt7ub@quack3>
References: <cover.1670606054.git.rgb@redhat.com>
 <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
 <20221216164342.ojcbdifdmafq5njw@quack3>
 <Y6TCWe4/nR957pFh@madcap2.tricolour.ca>
 <20230103124201.iopasddbtb6vi362@quack3>
 <Y8W2tcXFoUajzojc@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <Y8W2tcXFoUajzojc@madcap2.tricolour.ca>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 17 Jan 2023 13:47:21 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon 16-01-23 15:42:29, Richard Guy Briggs wrote:
> On 2023-01-03 13:42, Jan Kara wrote:
> > On Thu 22-12-22 15:47:21, Richard Guy Briggs wrote:
> > > > > +
> > > > > +	if (info_len != sizeof(*friar))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	if (copy_from_user(friar, info, sizeof(*friar)))
> > > > > +		return -EFAULT;
> > > > > +
> > > > > +	if (friar->hdr.type != FAN_RESPONSE_INFO_AUDIT_RULE)
> > > > > +		return -EINVAL;
> > > > > +	if (friar->hdr.pad != 0)
> > > > > +		return -EINVAL;
> > > > > +	if (friar->hdr.len != sizeof(*friar))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	return info_len;
> > > > > +}
> > > > > +
> > > > 
> > > > ...
> > > > 
> > > > > @@ -327,10 +359,18 @@ static int process_access_response(struct fsnotify_group *group,
> > > > >  		return -EINVAL;
> > > > >  	}
> > > > >  
> > > > > -	if (fd < 0)
> > > > > +	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> > > > >  		return -EINVAL;
> > > > >  
> > > > > -	if ((response & FAN_AUDIT) && !FAN_GROUP_FLAG(group, FAN_ENABLE_AUDIT))
> > > > > +	if (response & FAN_INFO) {
> > > > > +		ret = process_access_response_info(fd, info, info_len, &friar);
> > > > > +		if (ret < 0)
> > > > > +			return ret;
> > > > > +	} else {
> > > > > +		ret = 0;
> > > > > +	}
> > > > > +
> > > > > +	if (fd < 0)
> > > > >  		return -EINVAL;
> > > > 
> > > > And here I'd do:
> > > > 
> > > > 	if (fd == FAN_NOFD)
> > > > 		return 0;
> > > > 	if (fd < 0)
> > > > 		return -EINVAL;
> > > > 
> > > > As we talked in previous revisions we'd specialcase FAN_NOFD to just verify
> > > > extra info is understood by the kernel so that application writing fanotify
> > > > responses has a way to check which information it can provide to the
> > > > kernel.
> > > 
> > > The reason for including it in process_access_response_info() is to make
> > > sure that it is included in the FAN_INFO case to detect this extension.
> > > If it were included here
> > 
> > I see what you're getting at now. So the condition
> > 
> >  	if (fd == FAN_NOFD)
> >  		return 0;
> > 
> > needs to be moved into 
> > 
> > 	if (response & FAN_INFO)
> > 
> > branch after process_access_response_info(). I still prefer to keep it
> > outside of the process_access_response_info() function itself as it looks
> > more logical to me. Does it address your concerns?
> 
> Ok.  Note that this does not return zero to userspace, since this
> function's return value is added to the size of the struct
> fanotify_response when there is no error.

Right, good point. 0 is not a good return value in this case.

> For that reason, I think it makes more sense to return -ENOENT, or some
> other unused error code that fits, unless you think it is acceptable to
> return sizeof(struct fanotify_response) when FAN_INFO is set to indicate
> this.

Yeah, my intention was to indicate "success" to userspace so I'd like to
return whatever we return for the case when struct fanotify_response is
accepted for a normal file descriptor - looks like info_len is the right
value. Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

